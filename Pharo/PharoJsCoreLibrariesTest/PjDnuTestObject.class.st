Class {
	#name : #PjDnuTestObject,
	#superclass : #Object,
	#instVars : [
		'dnuMessage'
	],
	#category : #'PharoJsCoreLibrariesTest-Collections'
}

{ #category : #accessing }
PjDnuTestObject >> dnuMessage [
	^ dnuMessage
]

{ #category : #'reflective operations' }
PjDnuTestObject >> doesNotUnderstand: aMessage [
	dnuMessage := aMessage
]
