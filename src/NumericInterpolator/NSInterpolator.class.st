"
I determine the correct interpolator for a kind of data
my subclasses 
NSColorInterpolator
NSNumberInterpolator

The basic interpolation is between 2 values 
0 and 1, usually the value between these values is called 't'
"
Class {
	#name : #NSInterpolator,
	#superclass : #Object,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #interpolation }
NSInterpolator class >> colorInterpolator [
	^ NSColorRGBAInterpolator
]

{ #category : #interpolation }
NSInterpolator class >> interpolate: a and: b [
	| clazz |
	clazz := self interpolatorFor: b.
	^ clazz new start: a; stop: b
]

{ #category : #interpolation }
NSInterpolator class >> interpolatorFor: b [
	(b isString or: [ b isColor ]) ifTrue: [ ^ self colorInterpolator ].
	b isNumber ifTrue: [ ^ NSNumberInterpolator ].
	b isPoint ifTrue: [ ^ NSNumberInterpolator ].
	self error: 'Invalid value for interpolator'
]

{ #category : #interpolation }
NSInterpolator >> interpolate: anObject [
	self subclassResponsibility
]
