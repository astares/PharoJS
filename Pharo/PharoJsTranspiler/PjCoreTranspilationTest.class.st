Class {
	#name : #PjCoreTranspilationTest,
	#superclass : #PjSingleClassTranspilationTest,
	#category : #'PharoJsTranspiler-Tests'
}

{ #category : #accessing }
PjCoreTranspilationTest >> classToTranspile [
	^ self transpilerClass coreClass
]

{ #category : #testing }
PjCoreTranspilationTest >> testClassSideMethods [
	self assertClassMethod: #install:asGlobalNamed: equals: '(anObject,jsName){global[jsName]=anObject;return this}'.
]

{ #category : #testing }
PjCoreTranspilationTest >> testInstanceSideMethods [
	self assert: self classToTranspile methodDict size equals: 0
]

{ #category : #testing }
PjCoreTranspilationTest >> testOptimizedJsAt [
	| method asNil |
	asNil := PjStringGenerator nilTestFunctionName.
	method := self classMethod: #makeJavascriptSelector:.
	self assert: (method indexOfSubCollection: asNil,'(',asNil,'(aSelector[0])._61_(')>0.
	self assert: (method indexOfSubCollection: asNil ,'(this.selectorCache[aSelector])._ifNotNil_(')>0.

]