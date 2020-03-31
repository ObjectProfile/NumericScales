"
I uninterpolate a value of x acording to 2 limits, a and b
"
Class {
	#name : #TSUninterpolateNumber,
	#superclass : #TSUninterpolate,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #interpolating }
TSUninterpolateNumber >> uninterpolate: x [
	^ (x - a )/b
]
