"
This trait makes a test case export the app under test to JS and control it remotely on the JS interpreter.


"
Trait {
	#name : #PjTAppRunsInJS,
	#category : #'PharoJs-TestFramework-Kernel'
}

{ #category : #accessing }
PjTAppRunsInJS >> appClassToExport [
	^self appClass
]

{ #category : #accessing }
PjTAppRunsInJS >> currentApp [
	| jsMessage |
	jsMessage := PjJavascriptMessage receiverId: self appClass name selector: #currentInstance arguments: #().
	^self bridge evalMessage: jsMessage
]
