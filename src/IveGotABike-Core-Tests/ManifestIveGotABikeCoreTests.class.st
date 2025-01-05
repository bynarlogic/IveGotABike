"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestIveGotABikeCoreTests',
	#superclass : 'PackageManifest',
	#category : 'IveGotABike-Core-Tests-Manifest',
	#package : 'IveGotABike-Core-Tests',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestIveGotABikeCoreTests class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#CapabilityTest #testHandleError #false)) #'2025-01-04T11:07:18.308603-05:00') )
]
