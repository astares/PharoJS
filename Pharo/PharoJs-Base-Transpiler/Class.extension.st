Extension { #name : #Class }

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> asJsAstUsing: astConverter [
	^ astConverter
		visitGlobalNode: (RBGlobalNode named: self instanceSide name)
]

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> classInitializeSelector [
	(self hasClassMethod: #javascriptInitialize) ifTrue: [ ^#javascriptInitialize ].
	^#initialize
]

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> convertToJavascriptAstUsing: aPjAstConverter [
	^ aPjAstConverter visit: (RBGlobalNode named: self name)
]

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> convertToJsUsing: transpiler [
	transpiler convertClass: self.
]

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> hasJavascriptName [
	^self hasClassMethod: #javascriptName
]

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> isFreeJavascriptValue [
	^ true
]

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> nameToUseForJsConversion [
	self hasJavascriptPlaceholder ifTrue: [ ^self javascriptPlaceholder nameToUseForJsConversion].
	self hasJavascriptName ifFalse: [ ^self name].
	^self javascriptName
]

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> needsClassDefinition [
	self hasJavascriptPlaceholder ifTrue: [ ^self javascriptPlaceholder needsClassDefinition].
	self hasJavascriptName ifFalse: [ ^true].
	^self javascriptName = self name
]

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> needsInitialization [
	^(self hasClassMethod: #initialize) or: [ self hasClassMethod: #javascriptInitialize ]
]

{ #category : #'*PharoJs-Base-Transpiler' }
Class >> printJsOn: aStream [
	self error: 'Class doesn''t have a literal representation'
]
