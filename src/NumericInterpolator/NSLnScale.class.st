"
I use natural logarithms to compute scales.
"
Class {
	#name : #NSLnScale,
	#superclass : #NSLinearScale,
	#instVars : [
		'linear'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #accessing }
NSLnScale >> clamp [
	^ linear clamp
]

{ #category : #accessing }
NSLnScale >> clamp: x [
	 linear clamp: x
]

{ #category : #accessing }
NSLnScale >> domain: arr [
	| epsilon |
	epsilon := 2.220446049250313e-16.
	domain := arr collect: [ :i | i max: epsilon ].
	linear domain: (domain collect: [ :n | n ln ])
]

{ #category : #initialization }
NSLnScale >> initialize [
	super initialize.
	linear := self class linear
]

{ #category : #accessing }
NSLnScale >> interpolate [
	^ linear interpolate
]

{ #category : #accessing }
NSLnScale >> interpolate: x [
	linear interpolate: x
]

{ #category : #transformation }
NSLnScale >> invert: x [
	^ (linear invert: x) exp
]

{ #category : #accessing }
NSLnScale >> niceTicks: aNumberOfTicks [

	^ self ticks: aNumberOfTicks
]

{ #category : #accessing }
NSLnScale >> range [
	^ linear range
]

{ #category : #accessing }
NSLnScale >> range: x [
	linear range: x
]

{ #category : #transformation }
NSLnScale >> scale: x [

	^ linear scale: (x max: 2.220446049250313e-16) ln
]
