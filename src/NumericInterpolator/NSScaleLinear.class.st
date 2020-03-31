"
I follow the linear function
"
Class {
	#name : #NSScaleLinear,
	#superclass : #NSScale,
	#instVars : [
		'clamp',
		'input',
		'output'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #accessing }
NSScaleLinear >> clamp: aBool [
	"If clamp is specified, enables or disables clamping accordingly. If clamping is disabled and the scale is passed a value outside the domain, the scale may return a value outside the range through extrapolation. If clamping is enabled, the return value of the scale is always within the scale’s range."
	clamp := aBool.
	self rescale.
]

{ #category : #accessing }
NSScaleLinear >> domain: x [
	super domain: x.
	self rescale.
]

{ #category : #initialization }
NSScaleLinear >> initialize [
	super initialize.
	range := domain := #(0 1).
	clamp := false.
	interpolate := NSInterpolator.
	self rescale.
]

{ #category : #accessing }
NSScaleLinear >> interpolate: x [
	interpolate := x.
	self rescale.
]

{ #category : #transformation }
NSScaleLinear >> invert: y [
	^ input scale: y.
]

{ #category : #accessing }
NSScaleLinear >> range: r [
	super range: r.
	self rescale.
]

{ #category : #accessing }
NSScaleLinear >> rangeRound: x [
	"x is a range"
	self 
		range: x;
		interpolate: NSRoundInterpolator.
]

{ #category : #hooks }
NSScaleLinear >> rescale [
	| linear |
	linear := (domain size min: range size ) > 2
		ifTrue: [ NSScalePolylinear ]
		ifFalse: [ NSScaleBilinear ].
	uninterpolate := clamp
		ifTrue: [ NSUninterpolateClamp ]
		ifFalse: [ NSUninterpolateNumber ].
	output := linear new domain: domain; range: range; 
		uninterpolate: uninterpolate; interpolate: interpolate.
	output rescale.
	input := linear new domain: range; range: domain;
		uninterpolate: uninterpolate; interpolate: NSInterpolator.
	input rescale.
]

{ #category : #transformation }
NSScaleLinear >> scale: x [
	^ output scale: x
]
