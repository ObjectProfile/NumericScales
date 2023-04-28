"
A NSPowScaleTest is a test class for testing the behavior of NSPowScale
"
Class {
	#name : #NSPowScaleTest,
	#superclass : #TestCase,
	#category : #'NumericInterpolator-Tests'
}

{ #category : #'test - scales' }
NSPowScaleTest >> testPowScale [
	| pow |
	pow := NSPowScale new.

	self
		assert: pow exponent equals: 1;
		assert: (pow scale: 5) equals: 5.
	pow exponent: 2.
	self
		assert: (pow scale: 5) equals: 25;
		assert: (pow invert: 25) equals: 5;
		assert: pow exponent equals: 2.

	pow
		domain: #(0 100);
		range: #(-10 10);
		clamp: true.

	self
		assert: (pow scale: 200) equals: 10;
		assert: (pow scale: 99.9) closeTo: 9.960020000000004.
	pow interpolate: NSRoundInterpolator.
	self
		assert: pow interpolate equals: NSRoundInterpolator;
		assert: (pow scale: 99.9) equals: 10;
		assert: pow range equals: #(-10 10)
]

{ #category : #'test - scales' }
NSPowScaleTest >> testSqrt [
	| sqrt |
	sqrt := NSScale sqrt.

	self
		assert: sqrt class equals: NSPowScale;
		assert: sqrt exponent equals: 0.5;
		assert: ((sqrt scale: 9) closeTo: 3).

	sqrt := NSScale sqrt
		domain: #(0 36756666);
		range: #(0 220).
	self assert: (sqrt scale: 4661900) closeTo: 78.34947695663722
]

{ #category : #'test - scales' }
NSPowScaleTest >> testTicks [

	| expectedTicks scale |
	scale := NSPowScale new
		domain: { 1. 100 };
		range: { 0. 1 }.

	expectedTicks := (0 to: 1 count: 19) collect: [ :e | scale invert: e ].
	self assertCollection: (scale ticks: 19) hasSameElements: expectedTicks.

	self assert: (scale ticks: 107) size equals: 107
]
