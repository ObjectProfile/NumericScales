"
I am a interpolator to round numbers
"
Class {
	#name : #TSRoundInterpolator,
	#superclass : #TSAbstractInterpolator,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #interpolation }
TSRoundInterpolator class >> interpolate: a and: b [
	^ self new start: a; stop: b.
]

{ #category : #interpolation }
TSRoundInterpolator >> interpolate: t [
	^  (start + (stop * t)) rounded
]

{ #category : #accessing }
TSRoundInterpolator >> stop: b [
	stop := b - start
]
