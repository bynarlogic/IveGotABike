"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestIveGotABikeCore',
	#superclass : 'PackageManifest',
	#category : 'IveGotABike-Core-Manifest',
	#package : 'IveGotABike-Core',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestIveGotABikeCore class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#Agent)) #'2024-12-31T16:48:34.575194-05:00') )
]

{ #category : 'code-critics' }
ManifestIveGotABikeCore class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#BikeAgent #processMessages #false)) #'2024-12-27T21:54:25.984396-05:00') #(#(#RGPackageDefinition #(#'IveGotABike-Core')) #'2024-12-27T21:54:46.507193-05:00') )
]

{ #category : 'code-critics' }
ManifestIveGotABikeCore class >> ruleNoClassCommentRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'IveGotABike-Core')) #'2024-12-31T16:30:23.033816-05:00') )
]

{ #category : 'code-critics' }
ManifestIveGotABikeCore class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'IveGotABike-Core')) #'2024-12-27T21:57:24.93483-05:00') )
]

{ #category : 'code-critics' }
ManifestIveGotABikeCore class >> ruleSuperSendsNewRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'SecretsManager class' #instance #true)) #'2025-01-03T07:30:12.264006-05:00') )
]
