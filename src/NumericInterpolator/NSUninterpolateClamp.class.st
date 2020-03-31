"
I do not allow a value get off the scale of 
0 to 1
"
Class {
	#name : #NSUninterpolateClamp,
	#superclass : #NSUninterpolate,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #interpolating }
NSUninterpolateClamp >> uninterpolate: x [
	^ 0 max: (1 min: ((x - a ) / b))
]
