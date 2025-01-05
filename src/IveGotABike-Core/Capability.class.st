"
Capability is an abstract class representing modular, pluggable behaviors for agents.  
Each subclass implements provider-specific functionality, enabling agents to extend their abilities  
(e.g., querying an LLM or accessing external APIs) without hard dependencies.  
Capabilities embody polymorphism, eliminating conditional logic and promoting extensibility.

"
Class {
	#name : 'Capability',
	#superclass : 'Object',
	#instVars : [
		'model'
	],
	#category : 'IveGotABike-Core-Base',
	#package : 'IveGotABike-Core',
	#tag : 'Base'
}

{ #category : 'registration' }
Capability >> debugState [
	Transcript show: 'Capability State: ', model asString; cr.
]

{ #category : 'error handling' }
Capability >> handleError: message [
	Transcript show: 'Unhandled message: ', message; cr.
]

{ #category : 'messaging' }
Capability >> handleMesage: message [
	self subclassResponsibility.
]

{ #category : 'initialization' }
Capability >> initializeWithModel: modelName [
	model := modelName.
]

{ #category : 'accessing' }
Capability >> model [
	^ model
]

{ #category : 'initialization' }
Capability >> query: prompt [
	self subclassResponsibility.
]

{ #category : 'registration' }
Capability >> registerWithAgent: agent [
	agent addCapability: self.
]

{ #category : 'error handling' }
Capability >> testHandleError [
	Capability new; handleError: 'test message'.
	
	self assert: Transcript contents = 'test message'.

]

{ #category : 'classification' }
Capability >> updateModel: newModel [
	model := newModel.
]
