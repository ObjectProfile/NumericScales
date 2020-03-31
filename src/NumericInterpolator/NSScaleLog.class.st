"
for scale log
"
Class {
	#name : #NSScaleLog,
	#superclass : #NSScaleLinear,
	#instVars : [
		'linear',
		'base',
		'positive'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #accessing }
NSScaleLog >> base [
	^ base
]

{ #category : #accessing }
NSScaleLog >> base: number [
	base := number.
	linear domain: (domain collect: [:n | self lg: n ]).
]

{ #category : #accessing }
NSScaleLog >> clamp: x [
	 linear clamp: x
]

{ #category : #accessing }
NSScaleLog >> domain: arr [
	positive := arr first >= 0.
	domain := arr.
	linear domain: (arr collect: [:n | self lg: n]).
]

{ #category : #initialization }
NSScaleLog >> initialize [
	super initialize.
	linear := self class linear.
	base := 10.
	positive := true.
	domain := #(1 0).
]

{ #category : #accessing }
NSScaleLog >> interpolate [
	^ linear interpolate
]

{ #category : #accessing }
NSScaleLog >> interpolate: x [
	linear interpolate: x
]

{ #category : #transformation }
NSScaleLog >> invert: x [
	^ self pow: (linear invert: x).
]

{ #category : #'math functions' }
NSScaleLog >> lg: x [
	"logarithm"
	^ (positive 
		ifTrue: [ (x max: 0) ln ]
		ifFalse: [ (x > 0 ifTrue: [ 0 ] ifFalse: [ 0 - x ] ) ln negated ])
		/ (base ln).
		
]

{ #category : #'math functions' }
NSScaleLog >> pow: x [
	^ positive  
		ifTrue: [ base raisedTo: x ]
		ifFalse: [ (base raisedTo: x negated) negated ].
		
]

{ #category : #accessing }
NSScaleLog >> range [
	^ linear range
]

{ #category : #accessing }
NSScaleLog >> range: x [
	linear range: x
]

{ #category : #transformation }
NSScaleLog >> scale: x [
	^ linear scale: (self lg: x)
]
