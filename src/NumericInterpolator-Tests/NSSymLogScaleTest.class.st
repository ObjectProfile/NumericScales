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

	self assert: (log invert: 50) closeTo: 0
]

{ #category : #tests }
NSSymLogScaleTest >> testInvert [

	| scale domain range |
	domain := { -5.0 . 500.0 }.
	range := { 0. 1 }.
	scale := NSSymLogScale new
		domain: domain;
		range: range;
		yourself.
	self assert: scale domain first closeTo: (scale invert: scale range first).
	self assert: scale domain second closeTo: (scale invert: scale range second)
]

{ #category : #tests }
NSSymLogScaleTest >> testTicks [

	| expectedTicks scale |
	scale := NSSymLogScale new
		         domain: { -11. 100 };
		         range: { 0. 1 }.

	expectedTicks := (0 to: 1 count: 19) collect: [ :e | scale invert: e ].
	self assertCollection: (scale ticks: 19) hasSameElements: expectedTicks.

	self assert: (scale ticks: 107) size equals: 107
]
