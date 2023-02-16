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
	self assert: (s scale: 0) closeTo: 100.
	self assert: (s scale: 50) closeTo: 50
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
	
	self assert: (s scale: -100) closeTo: 100.
]
