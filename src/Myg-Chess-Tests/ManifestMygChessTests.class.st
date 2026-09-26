"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestMygChessTests',
	#superclass : 'PackageManifest',
	#category : 'Myg-Chess-Tests-Manifest',
	#package : 'Myg-Chess-Tests',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestMygChessTests class >> ruleReTestClassNameShouldEndWithTestRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#MyRookTests)) #'2026-09-26T15:51:51.158+02:00') )
]
