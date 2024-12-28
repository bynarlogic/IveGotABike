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
