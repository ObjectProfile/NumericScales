"
I follow the linear function
"
Class {
	#name : #NSLinearScale,
	#superclass : #NSScale,
	#instVars : [
		'clamp',
		'input',
		'output'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #accessing }
NSLinearScale >> clamp [
	^ clamp
]

{ #category : #accessing }
NSLinearScale >> clamp: aBool [
	"If clamp is specified, enables or disables clamping accordingly. If clamping is disabled and the scale is passed a value outside the domain, the scale may return a value outside the range through extrapolation. If clamping is enabled, the return value of the scale is always within the scale’s range."
	clamp := aBool.
	self rescale
]

{ #category : #accessing }
NSLinearScale >> domain: x [
	super domain: x.
	self rescale
]

{ #category : #initialization }
NSLinearScale >> initialize [
	super initialize.
	range := domain := #(0 1).
	clamp := false.
	interpolate := NSInterpolator.
	self rescale
]

{ #category : #accessing }
NSLinearScale >> input [
	^ input
]

{ #category : #accessing }
NSLinearScale >> interpolate: x [
	interpolate := x.
	self rescale
]

{ #category : #transformation }
NSLinearScale >> invert: y [
	^ input scale: y
]

{ #category : #accessing }
NSLinearScale >> output [
	^ output
]

{ #category : #accessing }
NSLinearScale >> range: r [
	super range: r.
	self rescale
]

{ #category : #accessing }
NSLinearScale >> rangeRound: x [
	"x is a range"
	self
		range: x;
		interpolate: NSRoundInterpolator
]

{ #category : #hooks }
NSLinearScale >> rescale [
	| linear |
	linear := (domain size min: range size ) > 2
		ifTrue: [ NSPolylinearScale ]
		ifFalse: [ NSBilinearScale ].
	uninterpolate := clamp
		ifTrue: [ NSUninterpolateClamp ]
		ifFalse: [ NSUninterpolateNumber ].
	output := linear new domain: domain; range: range;
		uninterpolate: uninterpolate; interpolate: interpolate.
	output rescale.
	input := linear new domain: range; range: domain;
		uninterpolate: uninterpolate; interpolate: NSInterpolator.
	input rescale
]

{ #category : #transformation }
NSLinearScale >> scale: x [
	^ output scale: x
]

{ #category : #transformation }
NSLinearScale >> ticks: anInteger [

	| rangeForDividing |
	rangeForDividing := range first to: range last count: anInteger.

	^ rangeForDividing collect: [ :e | self invert: e ]
]
