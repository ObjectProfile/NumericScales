"
I am a utility clas for NSScalePow
"
Class {
	#name : #NSPowPowScale,
	#superclass : #Object,
	#instVars : [
		'exponent'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #'instance creation' }
NSPowPowScale class >> exponent: exponent [
	^ self new 
		exponent: exponent;
		yourself
]

{ #category : #accessing }
NSPowPowScale >> exponent: aNumber [
	exponent := aNumber
]

{ #category : #transformations }
NSPowPowScale >> scale: x [
	^ x < 0
		ifTrue: [ (x negated raisedTo: exponent) negated ]
		ifFalse: [ x raisedTo: exponent ]
]
