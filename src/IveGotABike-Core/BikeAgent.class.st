Class {
	#name : 'BikeAgent',
	#superclass : 'Object',
	#instVars : [
		'state',
		'inbox',
		'log',
		'name'
	],
	#classVars : [
		'MaxTasks'
	],
	#category : 'IveGotABike-Core',
	#package : 'IveGotABike-Core'
}

{ #category : 'testing' }
BikeAgent >> canProcessMoreTasks [
	^ inbox size < MaxTasks.
]

{ #category : 'initialization' }
BikeAgent >> initialize [
	state := 'Idle'.
	inbox := OrderedCollection new.
	log := OrderedCollection new.
	name := UUID new asString.
	
	MaxTasks := 10.
]

{ #category : 'initialization' }
BikeAgent >> maxTasks: aNumber [
	MaxTasks := aNumber.
]

{ #category : 'initialization' }
BikeAgent >> processMessages [
    inbox do: [ :msg | 
        log add: msg.
        Transcript show: name, ' processed: ', msg; cr.
        state := 'Active'.
    ].
	 inbox removeAll.
]

{ #category : 'initialization' }
BikeAgent >> receive: aMessage [
	inbox add: aMessage.
	Transcript show: name, ' received: ', aMessage; cr.
	self processMessages.

]
