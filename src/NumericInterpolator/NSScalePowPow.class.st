"
I am a utility clas for NSScalePow
"
Class {
	#name : #NSScalePowPow,
	#superclass : #Object,
	#instVars : [
		'exponent'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #'instance creation' }
NSScalePowPow class >> exponent: exponent [
	^ self new 
		exponent: exponent;
		yourself
]

{ #category : #accessing }
NSScalePowPow >> exponent: aNumber [
	exponent := aNumber
]

{ #category : #transformations }
NSScalePowPow >> scale: x [
	^ x < 0
		ifTrue: [ (x negated raisedTo: exponent) negated ]
		ifFalse: [ x raisedTo: exponent ]
]
