Class {
	#name : 'AgentTest',
	#superclass : 'TestCase',
	#category : 'IveGotABike-Core-Tests',
	#package : 'IveGotABike-Core-Tests'
}

{ #category : 'tests' }
AgentTest >> testClone [ 
	| agent clone |
	agent := Agent new.
	agent setState: #key to: 'value'.
	clone := agent clone.
	self assert: (clone getState: #key) equals: 'value'.
	self assert: clone ~= agent.
]

{ #category : 'tests' }
AgentTest >> testDelegation [
	| agent delegate response |
	agent := Agent new.
	delegate := Agent new.
	delegate addMethod: 'greet: name ^ ''Hi, '', name.'.
	agent addDelegate: delegate.
	response := agent receive: #greet: with: 'Ada' from: nil.
	self assert: response equals: 'Hi, Ada'.
	Agent removeSelector: #greet:.

]

{ #category : 'tests' }
AgentTest >> testInitialization [ 
	| agent |
	agent := Agent new.
	self assert: agent state isEmpty.
	self assert: agent log isEmpty.
	self assert: agent delegates isEmpty.
]

{ #category : 'tests' }
AgentTest >> testMessageHandling [ 
	| agent response |
	agent := Agent new.
	agent addMethod: 'hello: name ^ ''Hello, '', name.' classified: 'dynamic'.
	response := agent receive: #hello: with: 'World' from: nil.
	self assert: response equals: 'Hello, World'.
	Agent removeSelector: #hello:.

]

{ #category : 'tests' }
AgentTest >> testReplayLog [ 
	| agent log |
	agent := Agent new.
	agent addMethod: 'increment: value ^ value + 1.'.
	agent receive: #increment: with: 5 from: nil.
	log := agent log.
	agent receive: #increment: with: 10 from: nil.
	agent replay.
	self assert: (log size) equals: 2.
	Agent removeSelector: #increment:.

]

{ #category : 'tests' }
AgentTest >> testStateManagement [ 
	| agent |
	agent := Agent new.
	agent setState: #key to: 'value'.
	self assert: (agent getState: #key) equals: 'value'.

]
