Class {
	#name : #PjLiteralGeneratorTranspilationTest,
	#superclass : #PjSingleClassTranspilationTest,
	#category : #'PharoJs-Base-Transpiler-Tests-Tests'
}

{ #category : #accessing }
PjLiteralGeneratorTranspilationTest >> classToTranspile [
	^ PjClassForDefinitionTest
]

{ #category : #tests }
PjLiteralGeneratorTranspilationTest >> testLiteralGeneratrion [
	self assert: self jsCode includes: 'i$(function _literal(){return 7}'.
	self assert: self jsCode includes: 'c$(function _literal(){return "abcdef"}'.
]
