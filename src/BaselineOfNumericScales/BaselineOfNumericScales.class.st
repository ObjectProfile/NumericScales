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
	spec for: #common do: [
		spec 
			package: #'NumericInterpolator';
			package: #'NumericNoise';
			package: #'NumericInterpolator-Test'.
		
		spec 
			group: 'Core' with: #(
				'NumericInterpolator'
				NumericNoise);
			group: 'Tests' with: #('Core' 'NumericInterpolator-Test');
			group: 'default' with: #('Core' 'Tests') ].		
	







]
