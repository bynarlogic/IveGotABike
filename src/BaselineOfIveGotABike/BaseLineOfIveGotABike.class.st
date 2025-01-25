"
Baseline class for loading traits to Pharo core classes. 
"
Class {
	#name : 'BaselineOfIveGotABike',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfIveGotABike',
	#package : 'BaselineOfIveGotABike'
}

{ #category : 'baselines' }
BaselineOfIveGotABike >> baseline: spec [
	spec
		for: #common do: [ 
			spec package: 'IveGotABike-Core-MenuBar';
			package: 'IveGotABike-Core';
			package: 'IveGotABike-Core-Tests'].
		spec postLoad: [ :loader | self postLoad: loader ].
]

{ #category : 'doits' }
BaselineOfIveGotABike >> postLoad: aPackageLoader [
   IGABMenubarMorph initialize.
]
