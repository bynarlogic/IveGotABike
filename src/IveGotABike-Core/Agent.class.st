Class {
	#name : 'Agent',
	#superclass : 'Object',
	#instVars : [
		'state',
		'log',
		'lockedBehaviors',
		'delegates'
	],
	#category : 'IveGotABike-Core',
	#package : 'IveGotABike-Core'
}

{ #category : 'delegating' }
Agent >> addDelegate: agent [
	delegates add: agent.
]

{ #category : 'copying' }
Agent >> clone [
	|copy|
	
   copy := self class new.
   copy state: state copy.
   copy log: log copy.
   copy lockedBehaviors: lockedBehaviors copy.
   copy delegates: delegates copy.
   ^ copy.
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

{ #category : 'messaging' }
Agent >> receive: signal with: data from: sender [
	(lockedBehaviors includes: signal) ifTrue: [ 
		^ self log: 'Locked: ', signal.
	].

	(self respondsTo: signal) ifTrue: [ 
		log add: { signal -> data }.
		^ self perform: signal with: data.
	].

	delegates do: [ :delegate | 
		(delegate respondsTo: signal) ifTrue: [ 
			^ delegate perform: signal with: data.
		]	
	].
	
	log add: { signal -> 'Ignored' }.
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

{ #category : 'state management' }
Agent >> setState: key to: value [
	state at: key put: value
]

{ #category : 'locking' }
Agent >> unlockBehavior: signal [
	lockedBehaviors remove: signal.
]
