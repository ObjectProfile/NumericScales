"
based on https://mrl.nyu.edu/~perlin/noise/
"
Class {
	#name : #NSPerlinNoise3,
	#superclass : #Object,
	#instVars : [
		'octaves',
		'p'
	],
	#category : #NumericNoise
}

{ #category : #public }
NSPerlinNoise3 >> grad2d: i x: x y: y [
	| v |
	v := (i &1) = 0 
		ifTrue: [ x ] 
		ifFalse: [ y ].
	^ (i & 2) = 0 ifTrue: [ v negated ] ifFalse: [ v ]
]

{ #category : #initialization }
NSPerlinNoise3 >> initialize [
	| r |
	super initialize.
	self octaves: 1.
	r := Random new.
	p := Dictionary new.
	0 to: 511 do: [ :i | 
		p at: i put: (r next * 256) asInteger ].
]

{ #category : #public }
NSPerlinNoise3 >> lerp: t a: a b: b [
	^ t * (b - a) + a
]

{ #category : #public }
NSPerlinNoise3 >> noise2d: xin and: yin [
	| x1 y1 x y fx fy p0 p1 |
	x1 := xin floor & 255.
	y1 := yin floor & 255.
	x := xin - xin floor.
	y := yin - yin floor.
	fx := (3- (2 * x)) * x * x.
	fy := (3 -(2 * y)) * y * y.
	p0 := (p at: x1) + y1.
	p1 := (p at: x1 + 1)+ y1.
	^ self lerp: fy 
		a: (self lerp: fx
			a: (self grad2d: (p at: p0) x: x y: y)
			b: (self grad2d: (p at: p1) x: x -1 y: y))
		b: (self lerp: fx
			a: (self grad2d: (p at: p0+1) x: x y: y-1)
			b: (self grad2d: (p at: p1+1) x: x -1 y: y-1)).
]

{ #category : #public }
NSPerlinNoise3 >> noise: aPoint [
	^ self noise: aPoint x and: aPoint y
]

{ #category : #public }
NSPerlinNoise3 >> noise: xin and: yin [
	| e k s |
	e := 1.
	k := 1.
	s := 0.
	1 to: octaves do: [ :i | 
		e := e * 0.5.
		s := s + (e * (1 + (self noise2d: k * xin and: k * yin)/2) ).
		k := k * 2 ].
	^ s
]

{ #category : #accessing }
NSPerlinNoise3 >> octaves: anInteger [
	octaves := anInteger
]
