Class {
	#name : #NSSLnScaleTest,
	#superclass : #TestCase,
	#category : #'NumericInterpolator-Tests'
}

{ #category : #tests }
NSSLnScaleTest >> testBasic [
	| s epsilon |
	epsilon := 2.220446049250313e-16.
	s:= NSLnScale new
		domain: {  -100. 50};
		range: { 100. 50 }.
	self assert: s domain equals: { epsilon. 50 }.
	self assert: (s scale: -1000) closeTo: 100.
	self assert: (s scale: 0) closeTo: 100
]

{ #category : #tests }
NSSLnScaleTest >> testMultiple [
	| s |
	s:= NSLnScale new
		domain: {  0. 50. 100 };
		range: { 100. 50. 200 }.
	self assert: (s scale: 0) closeTo: 100.
	self assert: (s scale: 50) closeTo: 50.
	self assert: (s scale: 100) closeTo: 200.

	self assert: (s scale: -100) closeTo: 100
]

{ #category : #tests }
NSSLnScaleTest >> testTicks [

	| expectedTicks scale |
	scale := NSSymLogScale new
		         domain: { 1. 100 };
		         range: { 0. 1 }.

	expectedTicks := (0 to: 1 count: 19) collect: [ :e | scale invert: e ].
	self assertCollection: (scale ticks: 19) hasSameElements: expectedTicks.

	self assert: (scale ticks: 107) size equals: 107
]
