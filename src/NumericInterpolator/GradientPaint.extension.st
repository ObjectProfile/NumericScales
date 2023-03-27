Extension { #name : #GradientPaint }

{ #category : #'*NumericInterpolator' }
GradientPaint >> interpolateTo: anObject at: t [
	| otherRamp ramp newRamp |
	otherRamp := anObject isColor
		ifTrue: [ colorRamp collect: [ :a | anObject ] ]
		ifFalse: [ anObject colorRamp ].
	ramp := self colorRamp.
	ramp size = otherRamp size ifFalse: [ self error: 'invalid sizes for color ramp' ].

	newRamp := self colorRamp collectWithIndex: [ :a :i | | a2 |
		a2 := otherRamp at: i.
		a key -> (a value interpolateTo: a2 value at: t) ].
	^ self copy
		colorRamp: newRamp
]
