"
Baseline class for loading traits to Pharo core classes. 
"
Class {
	#name : 'IGABBaseline',
	#superclass : 'Object',
	#category : 'IveGotABike-Core',
	#package : 'IveGotABike-Core'
}

{ #category : 'baselines' }
IGABBaseline >> baseline: spec [
	spec
		for: #common do: [ 
			spec package: 'IveGotABike-Core-MenuBar'].
		spec postLoad: [ :loader | self postLoad: loader ].
]

{ #category : 'doits' }
IGABBaseline >> postLoad: aPackageLoader [
   (Smalltalk at: #MenubarMorph) compile: 'traits IGABMenuBarTrait'.
]
