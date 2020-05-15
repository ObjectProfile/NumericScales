"
for scale log, for positive domains or negative domains
"
Class {
	#name : #NSLogScale,
	#superclass : #NSLinearScale,
	#instVars : [
		'linear',
		'base',
		'positive'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #accessing }
NSLogScale >> base [
	^ base
]

{ #category : #accessing }
NSLogScale >> base: number [
	base := number.
	linear domain: (domain collect: [:n | self lg: n ]).
]

{ #category : #accessing }
NSLogScale >> clamp [
	^ linear clamp
]

{ #category : #accessing }
NSLogScale >> clamp: x [
	 linear clamp: x
]

{ #category : #accessing }
NSLogScale >> domain: arr [
	positive := arr first >= 0.
	domain := arr.
	linear domain: (arr collect: [:n | self lg: n]).
]

{ #category : #initialization }
NSLogScale >> initialize [
	super initialize.
	linear := self class linear.
	base := 10.
	positive := true.
	domain := #(1 0).
]

{ #category : #accessing }
NSLogScale >> interpolate [
	^ linear interpolate
]

{ #category : #accessing }
NSLogScale >> interpolate: x [
	linear interpolate: x
]

{ #category : #transformation }
NSLogScale >> invert: x [
	^ self pow: (linear invert: x).
]

{ #category : #'math functions' }
NSLogScale >> lg: x [
	"logarithm"
	^ (positive 
		ifTrue: [ (x max: 0) ln ]
		ifFalse: [ (x > 0 
			ifTrue: [ 0 ] 
			ifFalse: [ 0 - x ] ) ln negated ])
		/ (base ln).
		
]

{ #category : #'math functions' }
NSLogScale >> pow: x [
	^ positive  
		ifTrue: [ base raisedTo: x ]
		ifFalse: [ (base raisedTo: x negated) negated ].
		
]

{ #category : #accessing }
NSLogScale >> range [
	^ linear range
]

{ #category : #accessing }
NSLogScale >> range: x [
	linear range: x
]

{ #category : #transformation }
NSLogScale >> scale: x [
	^ linear scale: (self lg: x)
]

{ #category : #accessing }
NSLogScale >> uninterpolate [
	^ linear uninterpolate
]

{ #category : #accessing }
NSLogScale >> uninterpolate: anUninterolator [
	linear uninterpolate: anUninterolator
]
