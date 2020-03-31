"
I am a interpolator to round numbers
"
Class {
	#name : #NSRoundInterpolator,
	#superclass : #NSAbstractInterpolator,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #interpolation }
NSRoundInterpolator class >> interpolate: a and: b [
	^ self new start: a; stop: b.
]

{ #category : #interpolation }
NSRoundInterpolator >> interpolate: t [
	^  (start + (stop * t)) rounded
]

{ #category : #accessing }
NSRoundInterpolator >> stop: b [
	stop := b - start
]
