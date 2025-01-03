"
The 'Agent' class is the foundation of the framework, serving as a dynamic, stateful unit capable of message passing, delegation, and runtime behavior modification.
Key Features:
- Stateful memory management for flexible data storage and retrieval.
- Message passing and delegation mechanisms enabling distributed communication.
- Debugging tools to inspect logs and states in real-time.
- Behavior locking to control signal handling dynamically.
- Cloning support for scalable agent replication.
This class forms the core computational model for building AI-driven workflows.

"
Class {
	#name : 'Agent',
	#superclass : 'Object',
	#instVars : [
		'state',
		'log',
		'lockedBehaviors',
		'delegates'
	],
	#category : 'IveGotABike-Core-Base',
	#package : 'IveGotABike-Core',
	#tag : 'Base'
}

{ #category : 'delegating' }
Agent >> addDelegate: agent [
	delegates add: agent.
]

{ #category : 'adding' }
Agent >> addMethod: source [ 
    self class compile: source classified: 'dynamic'.

]

{ #category : 'adding' }
Agent >> addMethod: source classified: category [ 
    self class compile: source classified: category.

]

{ #category : 'copying' }
Agent >> clone [
	|copy|
	
   copy := self class new.
   copy state: state copy.
   copy setLog: log copy.
   copy lockBehavior: lockedBehaviors copy.
   copy addDelegate: delegates copy.
   ^ copy.
]

{ #category : 'accessing' }
Agent >> delegates [
	^ delegates
]

{ #category : 'state management' }
Agent >> getState: key [
	^ state at: key ifAbsent: [ nil ]
]

{ #category : 'initialization' }
Agent >> initialize [ 
	state := Dictionary new.
	log := OrderedCollection new.
	lockedBehaviors := Set new.
	delegates := OrderedCollection new.
]

{ #category : 'debugging' }
Agent >> inspectLog [
	^ log inspect.
]

{ #category : 'debugging' }
Agent >> inspectState [
	^ state inspect.
]

{ #category : 'locking' }
Agent >> lockBehavior: signal [
	lockedBehaviors add: signal.
]

{ #category : 'locking' }
Agent >> lockedBehaviors [
	^ lockedBehaviors 
]

{ #category : 'accessing' }
Agent >> log [
	^ log
]

{ #category : 'debugging' }
Agent >> log: signal with: data [
   "Append a message to the log with a timestamp."
   log add: (signal -> data).
]

{ #category : 'messaging' }
Agent >> receive: signal with: data from: sender [
	(lockedBehaviors includes: signal) ifTrue: [ 
		^ self log: signal with: 'Locked: ', lockedBehaviors asString.
	].

	(self respondsTo: signal) ifTrue: [ 
		self log: signal with: data.
		^ self perform: signal with: data.
	].

	delegates do: [ :delegate | 
		(delegate respondsTo: signal) ifTrue: [ 
			^ delegate perform: signal with: data.
		]	
	].
	
	self log: signal with: 'Ignored'.
]

{ #category : 'delegating' }
Agent >> removeDelegate: agent [
	delegates remove: agent
]

{ #category : 'debugging' }
Agent >> replay [
	log do: [ :entry |
		self perform: (entry key) with: (entry value)
	].
]

{ #category : 'messaging' }
Agent >> send: signal to: recipient with: data [
	^ recipient receive: signal with: data from: self.
]

{ #category : 'initialization' }
Agent >> setLog: aCollection [ 
	log := aCollection 
]

{ #category : 'state management' }
Agent >> setState: key to: value [
	state at: key put: value
]

{ #category : 'accessing' }
Agent >> state [
	^ state
]

{ #category : 'accessing' }
Agent >> state: aCollection [ 
	state := aCollection
]

{ #category : 'locking' }
Agent >> unlockBehavior: signal [
	lockedBehaviors remove: signal.
]
