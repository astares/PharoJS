Class {
	#name : #PjObjectTest,
	#superclass : #PjBridgeTestCase,
	#category : #'PharoJsCoreLibrariesTest-Objects'
}

{ #category : #testing }
PjObjectTest >> testNewObjectHasNoEnumeratableKeys [
	"This is important for many JS third party libraries"
	self assertBlock: [ Object new allEnumeratableKeys isEmpty ] .

]

{ #category : #testing }
PjObjectTest >> testPerformWithMoreArgsThanRequired [
	| argsInJs argsInPharo messageCreationBlock |
	messageCreationBlock := [|obj|
		obj := PjDnuTestObject new.
		obj perform: #foo withArguments: #(1 2).
		obj dnuMessage arguments].
	argsInPharo := messageCreationBlock value.
	self assert: argsInPharo size equals: 2.
	self assert: argsInPharo first equals: 1.
	self assert: argsInPharo last equals: 2.
	self bridge loadClass: PjDnuTestObject.
	argsInJs := self evalBlock: messageCreationBlock.
	self assert: argsInJs size equals: messageCreationBlock size.
	self assert: argsInJs first equals: argsInPharo first.
	self assert: argsInJs last equals: argsInPharo last.

]

{ #category : #testing }
PjObjectTest >> testPrintString [
	self assert: [ Object new printString ] evaluatesTo: 'an Object'.
	self assert: [ PjSet new printString ] evaluatesTo: 'a PjSet'.
	self assert: [ 'hello world' printString ] evaluatesTo: 'hello world'.
	self assert: [ 123 printString ] evaluatesTo: '123'.
	self assert: [ true printString ] evaluatesTo: 'true'.
	

]

{ #category : #testing }
PjObjectTest >> testShallowCopy [
	self assertBlock: [
		|original clone|
		original := Object new.
		original instVarNamed: #a put: 1. 
		clone := original copy.
		clone class == Object and: [ (clone instVarNamed: #a) = 1 ]
		 ]
]
