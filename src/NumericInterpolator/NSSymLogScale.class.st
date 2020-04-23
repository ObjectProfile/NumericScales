"
I order to have a generic log scale for positive and negative log scales 
"
Class {
	#name : #NSSymLogScale,
	#superclass : #NSLinearScale,
	#instVars : [
		'constant',
		'linear'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #initialization }
NSSymLogScale >> clamp: x [
	 linear clamp: x
]

{ #category : #accessing }
NSSymLogScale >> constant [
	^ constant
]

{ #category : #accessing }
NSSymLogScale >> constant: aNumber [
	constant := aNumber.
]

{ #category : #initialization }
NSSymLogScale >> initialize [
	super initialize.
	linear := self class linear.
	self constant: 1.
	
]

{ #category : #initialization }
NSSymLogScale >> interpolate [
	^ linear interpolate
]

{ #category : #initialization }
NSSymLogScale >> interpolate: x [
	linear interpolate: x
]

{ #category : #initialization }
NSSymLogScale >> invert: x [
	^ self pow: (linear invert: x).
]

{ #category : #initialization }
NSSymLogScale >> scale: x [
	^ linear scale: (self lg: x)
]
