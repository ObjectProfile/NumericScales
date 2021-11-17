Class {
	#name : #NSClampTest,
	#superclass : #TestCase,
	#category : #'NumericInterpolator-Tests'
}

{ #category : #tests }
NSClampTest >> testBasic01 [
	| x |
	
	x := NSScale linear
		domain: { -100. 100 };
		range: { 500. 1000 }.
	self deny: x clamp.
	self assert: x uninterpolate equals: NSUninterpolateNumber.
	self assert: (x scale: 0) equals: 750.
	self assert: (x scale: 200) equals: 1250.
	self assert: (x invert: 1250) equals: 200.
	
	x clamp: true.
	self assert: x uninterpolate equals: NSUninterpolateClamp.
	self assert: (x scale: 0) equals: 750.
	self assert: (x scale: 200) equals: 1000.
	self assert: (x invert: 1250) equals: 100
	
	
]

{ #category : #tests }
NSClampTest >> testBasic02 [
	| x |
	x := NSScale sqrt
		domain: { -100. 100 };
		range: { 500. 1000 }.
	self deny: x clamp.
	self assert: (x scale: 0) equals: 750.
	self assert: (x scale: 200) closeTo: 1103.5533905932737.
	self assert: (x invert: 1103.5533905932737) closeTo: 200.
	
	x clamp: true.
	self assert: (x scale: 0) closeTo: 750.
	self assert: (x scale: 200) closeTo: 1000.
	self assert: (x invert: 1250) closeTo: 100
	
	
]

{ #category : #tests }
NSClampTest >> testBasic03 [
	| x |
	
	x := NSScale log
		domain: { 1. 100 };
		range: { 500. 1000 }.
	self deny: x clamp.
	self assert: x uninterpolate equals: NSUninterpolateNumber.
	self assert: (x scale: 1) closeTo: 500.
	self assert: (x scale: 200) closeTo: 1075.2574989159953.
	self assert: (x invert: 1075.2574989159953) closeTo: 200.
	
	x clamp: true.
	self assert: x uninterpolate equals: NSUninterpolateClamp.
	self assert: (x scale: 0) closeTo: 500.
	self assert: (x scale: 200) closeTo: 1000.
	self assert: (x invert: 1250) closeTo: 100
	
	
]
