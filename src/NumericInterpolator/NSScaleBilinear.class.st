"
I represent a bilinear range for 2 limits, start and end
"
Class {
	#name : #NSScaleBilinear,
	#superclass : #NSScale,
	#instVars : [
		'i',
		'u'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #transformation }
NSScaleBilinear >> invert: anObject [
	self shouldNotImplement
]

{ #category : #hooks }
NSScaleBilinear >> rescale [
	u := uninterpolate uninterpolate: domain first and: domain second.
	i := interpolate interpolate: range first and: range second.
]

{ #category : #transformation }
NSScaleBilinear >> scale: x [
	^ i interpolate: (u uninterpolate: x)
]
