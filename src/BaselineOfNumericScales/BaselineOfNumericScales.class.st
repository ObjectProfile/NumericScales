"
I am a baseline to load the object profile basic scales
"
Class {
	#name : #BaselineOfNumericScales,
	#superclass : #BaselineOf,
	#category : #BaselineOfNumericScales
}

{ #category : #baselines }
BaselineOfNumericScales >> baseline: spec [
	<baseline>
	spec
		for: #'pharo8.x' do: [ self baselineFor: spec ];
		for: #'pharo9.x' do: [ self baselineFor: spec ];
		for: #'pharo10.x' do: [ self baselineFor: spec ];
		"current version 11"
		for: #common do: [ self baselineForCommon: spec ]
]

{ #category : #baselines }
BaselineOfNumericScales >> baselineFor: spec [
	"baseline for old pharo versions less than pharo11"
	self packages: spec.
	spec package: 'NumericExtension'.
	self group: spec.
	spec group: 'Core' with: #( 'NumericInterpolator' 'NumericNoise' 'NumericExtension')
]

{ #category : #baselines }
BaselineOfNumericScales >> baselineForCommon: spec [
	self packages: spec.
	self group: spec
]

{ #category : #baselines }
BaselineOfNumericScales >> group: spec [
	spec
		group: 'Core' with: #( 'NumericInterpolator' 'NumericNoise');
		group: 'Tests' with: #('Core' 'NumericInterpolator-Tests');
		group: 'default' with: #('Core' 'Tests')
]

{ #category : #baselines }
BaselineOfNumericScales >> packages: spec [
	spec
		package: #'NumericInterpolator';
		package: #'NumericNoise';
		package: #'NumericInterpolator-Tests'
]
