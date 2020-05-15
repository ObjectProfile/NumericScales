"
I uninterpolate a value of x acording to 2 limits, a and b without limitation
"
Class {
	#name : #NSUninterpolateNumber,
	#superclass : #NSUninterpolate,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #interpolating }
NSUninterpolateNumber >> uninterpolate: x [
	^ (x - a )/b
]
