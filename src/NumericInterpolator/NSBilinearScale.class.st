"
I represent a bilinear range for 2 limits, start and end
"
Class {
	#name : #NSBilinearScale,
	#superclass : #NSScale,
	#instVars : [
		'i',
		'u'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #transformation }
NSBilinearScale >> invert: anObject [
	self shouldNotImplement
]

{ #category : #hooks }
NSBilinearScale >> rescale [
	u := uninterpolate uninterpolate: domain first and: domain second.
	i := interpolate interpolate: range first and: range second
]

{ #category : #transformation }
NSBilinearScale >> scale: x [
	^ i interpolate: (u uninterpolate: x)
]
