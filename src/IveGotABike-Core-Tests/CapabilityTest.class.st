Class {
	#name : 'CapabilityTest',
	#superclass : 'TestCase',
	#instVars : [
		'capability',
		'mockAgent'
	],
	#category : 'IveGotABike-Core-Tests',
	#package : 'IveGotABike-Core-Tests'
}

{ #category : 'running' }
CapabilityTest >> setUp [
	capability := Capability new initializeWithModel: 'test-model'.
]

{ #category : 'running' }
CapabilityTest >> testInitialization [
    self assert: capability model equals: 'test-model'.
]

{ #category : 'running' }
CapabilityTest >> testUpdateModel [
    capability updateModel: 'new-model'.
    self assert: capability model equals: 'new-model'.
]
