"
A NSLinearScaleTest is a test class for testing the behavior of NSLinearScale
"
Class {
	#name : #NSLinearScaleTest,
	#superclass : #TestCase,
	#category : #'NumericInterpolator-Tests'
}

{ #category : #running }
NSLinearScaleTest >> classToTest [
	^ NSLinearScale
]

{ #category : #'test - scales' }
NSLinearScaleTest >> testSameRange [
	| sc |
	sc := self classToTest new
		domain: #(0 100);
		range: #(100 100).
	self assert: (sc scale: 0) equals: 100.
	self assert: (sc scale: 50) equals: 100.
	self assert: (sc scale: 100) equals: 100.
	self assert: (sc scale: 123123) equals: 100.

	sc := NSScale linear
		domain: #(0 100);
		range: #(0 0).
	self assert: (sc scale: 0) equals: 0.
	self assert: (sc scale: 50) equals: 0.
	self assert: (sc scale: 100) equals: 0.
	self assert: (sc scale: 123123) equals: 0
]

{ #category : #'test - linear' }
NSLinearScaleTest >> testScaleLinear [
	| linear |
	linear := self classToTest new.
	self
		assert: linear domain equals: #(0 1);
		assert: linear range equals: #(0 1).
	linear range: #(1 10).
	self
		assert: (linear scale: 1) equals: 10;
		assert: (linear scale: 0.5) equals: 5.5.

	self assert: linear interpolate equals: NSInterpolator.
	self assert: linear uninterpolate equals: NSUninterpolateNumber
]

{ #category : #'test - linear' }
NSLinearScaleTest >> testScaleLinearClamp [
	| linear |
	linear := self classToTest new
		domain: #(0 10);
		range: #(0 100).
	self assert: (linear scale: 11) equals: 110.
	self assert: (linear scale: -5) equals: -50.
	linear clamp: true.
	self assert: (linear scale: 11) equals: 100.
	self assert: (linear scale: -5) equals: 0
]

{ #category : #'test - linear' }
NSLinearScaleTest >> testScaleLinearColors [
	| linear |
	linear := self classToTest new
		domain: #(0 100);
		range: #('white' 'black').
	self assert: (linear scale: 50) equals: Color gray.
	self assert: (linear scale: 0) equals: Color white.
	self assert: (linear scale: 100) equals: Color black
]

{ #category : #'test - linear' }
NSLinearScaleTest >> testScaleLinearInvert [
	| linear |
	linear := self classToTest new
		domain: #(-5 5);
		range: #(40 50).
	self
		assert: (linear scale: 0) equals: 45;
		assert: (linear scale: 5) equals: 50;
		assert: (linear invert: 50) equals: 5;
		assert: (linear invert: 40) equals: -5
]

{ #category : #'test - linear' }
NSLinearScaleTest >> testScaleLinearRound [
	| linear |
	linear := self classToTest new
		domain: #(-5 5);
		rangeRound: #(40 50).
	self
		assert: (linear scale: 0.2) equals: 45;
		assert: (linear scale: 5.1) equals: 50;
		assert: (linear invert: 50) equals: 5;
		assert: (linear invert: 40) equals: -5
]

{ #category : #tests }
NSLinearScaleTest >> testTicks [

	| expectedTicks scale |
	scale := self classToTest new
		         domain: { 0. 100 };
		         range: { 0. 1 }.

	expectedTicks := { 0. 25. 50. 75. 100 }.
	self assertCollection: (scale ticks: 5) hasSameElements: expectedTicks.

	expectedTicks := { 0. 10. 20. 30. 40. 50. 60. 70. 80. 90. 100 }.
	self assertCollection: (scale ticks: 11) hasSameElements: expectedTicks.

	self assert: (scale ticks: 107) size equals: 107
]
