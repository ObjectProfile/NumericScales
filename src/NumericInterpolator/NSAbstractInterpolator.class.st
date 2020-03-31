"
I have two ranges the start an the stop
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

{ #category : #accessing }
NSAbstractInterpolator >> start: anObject [
	start := anObject
]

{ #category : #accessing }
NSAbstractInterpolator >> stop: anObject [
	stop := anObject
]
