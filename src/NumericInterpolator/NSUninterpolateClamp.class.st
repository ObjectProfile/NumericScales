"
I am a private class useful to uninterpolate a value in the range { 0. 1 }.

Scales with `clamp:` should limit their ranges and domains.

Example
```Smalltalk
x := NSScale linear
	clamp: true;
	domain: { -100. 100 };
	range: { 500. 1000 }.
x scale: 200.
""1000""
x invert: 1250.
""100""
``` 

"
Class {
	#name : #NSUninterpolateClamp,
	#superclass : #NSUninterpolate,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #interpolating }
NSUninterpolateClamp >> uninterpolate: x [
	^ 0 max: (1 min: ((x - a ) / b))
]
