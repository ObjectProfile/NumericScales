"
I am a utility clas for CAScalePow
"
Class {
	#name : #TSScalePowPow,
	#superclass : #Object,
	#instVars : [
		'exponent'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #'instance creation' }
TSScalePowPow class >> exponent: exponent [
	^ self new 
		exponent: exponent;
		yourself
]

{ #category : #accessing }
TSScalePowPow >> exponent: aNumber [
	exponent := aNumber
]

{ #category : #transformations }
TSScalePowPow >> scale: x [
	^ x < 0
		ifTrue: [ (x negated raisedTo: exponent) negated ]
		ifFalse: [ x raisedTo: exponent ]
]
