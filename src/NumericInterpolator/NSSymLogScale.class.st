"
I order to have a generic log scale for positive and negative log scales 

Inspired from https://github.com/d3/d3-scale/blob/master/src/symlog.js
"
Class {
	#name : #NSSymLogScale,
	#superclass : #NSScale,
	#instVars : [
		'constant',
		'linear'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #accessing }
NSSymLogScale >> clamp [
	^ linear clamp
]

{ #category : #accessing }
NSSymLogScale >> clamp: x [
	 linear clamp: x
]

{ #category : #accessing }
NSSymLogScale >> constant [
	^ constant
]

{ #category : #accessing }
NSSymLogScale >> constant: aNumber [
	constant := aNumber
]

{ #category : #accessing }
NSSymLogScale >> domain: arr [
	domain := arr.
	linear domain: (arr collect: [ :i | self transformSymLog: i ])
]

{ #category : #initialization }
NSSymLogScale >> initialize [
	super initialize.
	self constant: 1.
	linear := self class linear
]

{ #category : #accessing }
NSSymLogScale >> interpolate [
	^ linear interpolate
]

{ #category : #accessing }
NSSymLogScale >> interpolate: x [
	linear interpolate: x
]

{ #category : #transformation }
NSSymLogScale >> invert: x [
	^ self transformSymExp: (linear invert: x)
]

{ #category : #accessing }
NSSymLogScale >> range [
	^ linear range
]

{ #category : #accessing }
NSSymLogScale >> range: x [

	range := x.
	linear range: x
]

{ #category : #transformation }
NSSymLogScale >> scale: x [
	^ linear scale: (self transformSymLog: x)
]

{ #category : #accessing }
NSSymLogScale >> transformSymExp: x [
	^ x sign *  (x abs exp - 1) * constant
]

{ #category : #accessing }
NSSymLogScale >> transformSymLog: x [
	^ x sign * (1.0 + (x / constant) abs) ln
]
