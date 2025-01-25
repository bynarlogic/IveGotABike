"
Baseline class for loading traits to Pharo core classes. 
"
Class {
	#name : 'BaseLineOfIveGotABike',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfIveGotABike',
	#package : 'BaselineOfIveGotABike'
}

{ #category : 'baselines' }
BaseLineOfIveGotABike >> baseline: spec [
	spec
		for: #common do: [ 
			spec package: 'IveGotABike-Core-MenuBar';
			package: 'IveGotABike-Core';
			package: 'IveGotABike-Core-Tests'].
		spec postLoad: [ :loader | self postLoad: loader ].
]

{ #category : 'doits' }
BaseLineOfIveGotABike >> postLoad: aPackageLoader [
   IGABMenubarMorph initialize.
]
