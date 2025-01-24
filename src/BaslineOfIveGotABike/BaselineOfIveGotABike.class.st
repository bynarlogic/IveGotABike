"
Baseline class for loading traits to Pharo core classes. 
"
Class {
	#name : 'BaseLineOfIveGotABike',
	#superclass : 'Object',
	#category : 'BaslineOfIveGotABike',
	#package : 'BaslineOfIveGotABike'
}

{ #category : 'baselines' }
IGABBaseline >> baseline: spec [
	spec
		for: #common do: [ 
			spec package: 'IveGotABike-Core-MenuBar';
			package: 'IveGotABike-Core';
			package: 'IveGotABike-Core-Tests'].
		spec postLoad: [ :loader | self postLoad: loader ].
]

{ #category : 'doits' }
IGABBaseline >> postLoad: aPackageLoader [
   (Smalltalk at: #MenubarMorph) compile: 'traits IGABMenuBarTrait'.
]
