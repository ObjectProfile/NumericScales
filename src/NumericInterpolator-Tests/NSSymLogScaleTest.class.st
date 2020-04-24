Class {
	#name : #NSSymLogScaleTest,
	#superclass : #TestCase,
	#category : #'NumericInterpolator-Tests'
}

{ #category : #tests }
NSSymLogScaleTest >> testBasic [
	| log |
	log := NSSymLogScale new
		domain: #(0 100);
		range: #(50 1150).
	self assert: (log scale: 71) closeTo: 1069.330419162588.
	self assert: (log scale: 0) closeTo: 50.
	
	self assert: (log invert: 50) closeTo: 0.
]
