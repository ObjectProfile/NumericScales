"
I have two ranges the start and the stop
"
Class {
	#name : #NSAbstractInterpolator,
	#superclass : #NSInterpolator,
	#instVars : [
		'start',
		'stop'
	],
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #testing }
NSAbstractInterpolator class >> isAbstract [ ^ self == NSAbstractInterpolator
]

{ #category : #accessing }
NSAbstractInterpolator >> start: anObject [
	start := anObject
]

{ #category : #accessing }
NSAbstractInterpolator >> stop: anObject [
	stop := anObject
]
