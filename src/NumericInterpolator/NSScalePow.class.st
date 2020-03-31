"
I scale using pow function
"
Class {
	#name : #NSScalePow,
	#superclass : #NSScaleLinear,
	#instVars : [
		'linear',
		'exponent',
		'powp',
		'powb'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #accessing }
NSScalePow >> clamp: x [
	linear clamp: x
]

{ #category : #accessing }
NSScalePow >> domain: x [
	linear domain: ((domain := x) collect: [ :i | powp scale: i ]).
]

{ #category : #accessing }
NSScalePow >> exponent [
	^ exponent
]

{ #category : #accessing }
NSScalePow >> exponent: x [
	exponent := x.
	powp exponent: exponent.
	powb exponent: 1/exponent.
	linear domain: (domain collect: [ :i | powp scale: i ])
]

{ #category : #initialization }
NSScalePow >> initialize [
	super initialize.
	linear := self class linear.
	exponent := 1.
	domain := #(0 1).
	powp := NSScalePowPow exponent: exponent.
	powb := NSScalePowPow exponent: 1 / exponent.
]

{ #category : #initialization }
NSScalePow >> interpolate [
	^ linear interpolate
]

{ #category : #initialization }
NSScalePow >> interpolate: x [
	linear interpolate: x
]

{ #category : #initialization }
NSScalePow >> invert: x [
	^ powb scale: (linear invert: x)
]

{ #category : #initialization }
NSScalePow >> range [
	^ linear range
]

{ #category : #initialization }
NSScalePow >> range: x [
	linear range: x
]

{ #category : #initialization }
NSScalePow >> rescale [
]

{ #category : #initialization }
NSScalePow >> scale: x [
	^ linear scale: (powp scale: x)
]
