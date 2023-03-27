"
I can handle a several kind of values
"
Class {
	#name : #NSPolylinearScale,
	#superclass : #NSScale,
	#instVars : [
		'k',
		'u',
		'i'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #private }
NSPolylinearScale >> findJ: x [
	| lo hi mid |
	lo := 2.
	hi := k.
	[ lo < hi ] whileTrue: [
		mid := ((lo + hi) / 2) asInteger.
		(domain at: mid) > x
			ifTrue: [ hi := mid ]
			ifFalse: [ lo := mid + 1 ] ].
	^ lo - 1
]

{ #category : #transformation }
NSPolylinearScale >> invert: anObject [
	self shouldNotImplement
]

{ #category : #hooks }
NSPolylinearScale >> rescale [
	| obj |
	u := OrderedCollection new.
	i := OrderedCollection new.
	k := domain size min: range size.
	obj := domain at: k.

	((obj class canUnderstand: #<) and: [obj < domain first]) ifTrue: [
		domain := domain reverse.
		range := range reverse ].

	2 to: k do: [ :j |
		u add: (uninterpolate uninterpolate: (domain at: j -1 ) and: (domain at: j)).
		i add: (interpolate interpolate: (range at: j -1) and: (range at: j) )
		 ]
]

{ #category : #transformation }
NSPolylinearScale >> scale: x [
	| j |
	j := self findJ: x.
	^ (i at: j) interpolate: ((u at: j) uninterpolate: x)
]
