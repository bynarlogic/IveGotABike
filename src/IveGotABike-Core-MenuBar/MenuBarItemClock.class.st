Class {
	#name : 'MenuBarItemClock',
	#superclass : 'MenubarItemMorph',
	#instVars : [
		'updateProcess'
	],
	#category : 'IveGotABike-Core-MenuBar',
	#package : 'IveGotABike-Core-MenuBar'
}

{ #category : 'accessing' }
MenuBarItemClock >> currentTime [
	|hour minute|
	
	hour := DateAndTime now hour asString.
	minute := DateAndTime now minute printPaddedWith: $0 to: 2.
	
	^ hour , ':' , minute.
]

{ #category : 'initialization' }
MenuBarItemClock >> initialize [
	super initialize.
	
	self contents: '00:00'.
	self startUpdating.
]

{ #category : 'updating' }
MenuBarItemClock >> startUpdating [
	updateProcess := [ 
		[ 
		self contents: self currentTime.
		(Delay forSeconds: 1) wait.
		] repeat .
	] fork.
]
