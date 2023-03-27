"
I scale using pow function
"
Class {
	#name : #NSPowScale,
	#superclass : #NSLinearScale,
	#instVars : [
		'linear',
		'exponent',
		'powp',
		'powb'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #accessing }
NSPowScale >> clamp [
	^ linear clamp
]

{ #category : #accessing }
NSPowScale >> clamp: x [
	linear clamp: x
]

{ #category : #accessing }
NSPowScale >> domain: x [
	linear domain: ((domain := x) collect: [ :i | powp scale: i ])
]

{ #category : #accessing }
NSPowScale >> exponent [
	^ exponent
]

{ #category : #accessing }
NSPowScale >> exponent: x [
	exponent := x.
	powp exponent: exponent.
	powb exponent: 1/exponent.
	linear domain: (domain collect: [ :i | powp scale: i ])
]

{ #category : #initialization }
NSPowScale >> initialize [
	super initialize.
	linear := self class linear.
	exponent := 1.
	domain := #(0 1).
	powp := NSPowPowScale exponent: exponent.
	powb := NSPowPowScale exponent: 1 / exponent
]

{ #category : #initialization }
NSPowScale >> interpolate [
	^ linear interpolate
]

{ #category : #initialization }
NSPowScale >> interpolate: x [
	linear interpolate: x
]

{ #category : #initialization }
NSPowScale >> invert: x [
	^ powb scale: (linear invert: x)
]

{ #category : #initialization }
NSPowScale >> range [
	^ linear range
]

{ #category : #initialization }
NSPowScale >> range: x [
	linear range: x
]

{ #category : #initialization }
NSPowScale >> rescale [
]

{ #category : #initialization }
NSPowScale >> scale: x [
	^ linear scale: (powp scale: x)
]
