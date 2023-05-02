Class {
	#name : #NSNumberTest,
	#superclass : #TestCase,
	#category : #'NumericInterpolator-Tests'
}

{ #category : #tests }
NSNumberTest >> testToCount [

	| c |
	c := 1 to: 10 count: 5.
	self assert: c size equals: 5
]

{ #category : #tests }
NSNumberTest >> testToCount2 [

	| c |
	c := 1 to: 10 count: 2.
	self assert: c size equals: 2
]

{ #category : #tests }
NSNumberTest >> testToCount3 [

	| c |
	c := 1 to: 10 count: 1.
	self assert: c size equals: 1.
	self assert: c equals: (Array with: 1)
]

{ #category : #tests }
NSNumberTest >> testToCount4 [

	| c |
	c := 0.02 to: 1.0 count: 120.
	self assert: c first equals: 0.02.
	self assert: c last equals: 1.0.
	self assert: c size equals: 120
]
