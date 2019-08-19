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
		spec package: #'NumericScales'.
			
		spec 
			group: 'Core' with: #('NumericScales');
			group: 'default' with: #('Core') ].		
	







]
