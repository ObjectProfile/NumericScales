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
NSLnScale >> clamp: x [
	 linear clamp: x
]

{ #category : #accessing }
NSLnScale >> domain: arr [
	domain := arr collect: [:i | i max: Float epsilon ].
	linear domain: (domain collect: [:n | n ln ]).
]

{ #category : #accessing }
NSLnScale >> initialize [
	super initialize.
	linear := self class linear.
]

{ #category : #accessing }
NSLnScale >> interpolate [
	^ linear interpolate
]

{ #category : #accessing }
NSLnScale >> interpolate: x [
	linear interpolate: x
]

{ #category : #accessing }
NSLnScale >> invert: x [
	^ (linear invert: x) exp.
]

{ #category : #accessing }
NSLnScale >> range [
	^ linear range
]

{ #category : #accessing }
NSLnScale >> range: x [
	linear range: x
]

{ #category : #accessing }
NSLnScale >> scale: x [
	^ linear scale: (x max: Float epsilon) ln
]
