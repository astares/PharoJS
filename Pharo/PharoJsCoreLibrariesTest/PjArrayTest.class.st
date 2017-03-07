Class {
	#name : #PjArrayTest,
	#superclass : #PjBridgeTestCase,
	#category : #PharoJsCoreLibrariesTest
}

{ #category : #testing }
PjArrayTest >> testArrayClassDoesNotOverlapWithArrayFunction [
	self assertJavascript: 'typeof Array' evaluatesTo: 'function'.
	self assertJavascript: 'typeof PjArray' evaluatesTo: 'undefined'.

]

{ #category : #testing }
PjArrayTest >> testArrayWith1Element [
	self assert: [{1}] evaluatesToRaw: '[1]'.
	self assert: [#(1)] evaluatesToRaw: '[1]'.

]

{ #category : #testing }
PjArrayTest >> testArrayWith2Elements [
	self assert: [{1. 2}] evaluatesToRaw: '[1,2]'.
	self assert: [#(1 2)] evaluatesToRaw: '[1,2]'.

]

{ #category : #testing }
PjArrayTest >> testArrayWithMoreElements [
	self assert: [{1. 2}] evaluatesToRaw: '[1,2]'.
	self assert: [#(1 2)] evaluatesToRaw: '[1,2]'.
	self assert: [#(1 true 'id' 'x\y"z')] evaluatesToRaw: '[1,true,"id","x\\y\"z"]'. 
]

{ #category : #testing }
PjArrayTest >> testAt [
	| array |
	array := bridge evalBlock: [#(10 20 30 40)].
	#(10 20 30 40) doWithIndex: [ : expectedValue : index  | 
		self assert: [array at: index] evaluatesTo:  expectedValue
	].
	
	
]

{ #category : #testing }
PjArrayTest >> testAtPut [
	| array |
	array := bridge evalBlock: [#(10 20 30 40)].
	#(11 22  33 44)  doWithIndex: [ : newValue : index  | 
		bridge evalBlock: [array at: index put: newValue]
	].
	self assert: [array] evaluatesToRaw: '[11,22,33,44]'
	
	
]

{ #category : #testing }
PjArrayTest >> testCollect [
	| double |
	double := bridge evalBlock: [|array| array := #(10 20 30 40).
	array collect: [ : element | 2 * element]].
	#(20 40 60 80)  doWithIndex: [ : expectedValue : index  | 
		self assert: [(double at: index) = expectedValue] evaluatesTo: true
	].
	
	
]

{ #category : #testing }
PjArrayTest >> testDetectIfFound [
	self
		assertEquivalent: [|array found|
			array := #(1 2 3 4).
			found := false.
			array detect: [ : element | console log: element. element == 2] ifFound: [found := true].
			found].

]

{ #category : #testing }
PjArrayTest >> testDetectIfNone [
	self 
		assertEquivalent: [|array notFound| array := #(1 2 3 4).
			notFound := false.
			array detect: [ : element | element == 5] ifNone: [notFound := true].
			notFound].

]

{ #category : #testing }
PjArrayTest >> testDo [
	self
		assertEquivalent: [|array total|
			array := #(1 2 3 4).
			total := 0.
			array do: [ : element | total := total + element].
			total].

]

{ #category : #testing }
PjArrayTest >> testDoWithIndex [
	self
		assertEquivalent: [|array total|
			array := #(10 20 30 40).
			total := 0.
			array doWithIndex: [ : element : index | total := total + index].
			total].

]

{ #category : #testing }
PjArrayTest >> testEmptyArray [
	self assert: [{}] evaluatesToRaw: '[]'.
	self assert: [#()] evaluatesToRaw: '[]'.

]

{ #category : #testing }
PjArrayTest >> testEquality [
	self assertEquivalent: [#() = #()].
	self assertEquivalent: [#(11) = #(11)].
	self assertEquivalent: [#(11 22) = #(11 22)].
	self assertEquivalent: [#(11 22 33) = #(11 22 33)].
	self assertEquivalent: [#(11 33 22) = #(11 22 33)].
	
	
	
	
]

{ #category : #testing }
PjArrayTest >> testInserElement [
	
]

{ #category : #testing }
PjArrayTest >> testIsEmpty [
	self assertEquivalent: [#() isEmpty].
	self assertEquivalent: [#(11) isEmpty].
	self assertEquivalent: [#(11 22 33) isEmpty].

]

{ #category : #testing }
PjArrayTest >> testNotEmpty [
	self assertEquivalent: [#() notEmpty].
	self assertEquivalent: [#(11) notEmpty].
	self assertEquivalent: [#(11 22 33) notEmpty].
	
	
	
	
]

{ #category : #testing }
PjArrayTest >> testSize [
	self assertEquivalent: [#() size].
	self assertEquivalent: [#(11 ) size].
	self assertEquivalent: [#(11 22) size].
	self assertEquivalent: [#(11 22 33) size].

]