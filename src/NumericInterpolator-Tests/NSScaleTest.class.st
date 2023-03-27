"
A NSScaleTest is a test class for testing the behavior of NSScale
"
Class {
	#name : #NSScaleTest,
	#superclass : #TestCase,
	#category : #'NumericInterpolator-Tests'
}

{ #category : #tests }
NSScaleTest >> testAccessors [
	self assert: NSScale linear class equals: NSLinearScale.
	self assert: NSScale log class equals: NSLogScale.
	self assert: NSScale sqrt class equals: NSPowScale.
	self assert: NSScale pow class equals: NSPowScale.
	self assert: NSScale ordinal class equals: NSOrdinalScale
]

{ #category : #tests }
NSScaleTest >> testAccessorsColors [
	#(category10 category20 category20b category20c eva10 google20 paired12 sky8)
		do: [ :sel| | scale |
		scale := NSScale perform: sel.
		self assert: scale class equals: NSOrdinalScale.
		self assert: scale range class equals: Array.
		self assert: scale range first class equals: Color ]
]

{ #category : #'test - colors' }
NSScaleTest >> testCategories [
	| color |
	color := NSScale category10.
	self assert: color range size equals: 10.

	1 to: 10 do: [ :i |
		self assert: (color scale: i) class equals: Color ].

	1 to: 10 do: [ :i |
		self assert: (color scale: i) equals: (color scale: i + 10) ].

	color := NSScale category20.

	self assert: color range size equals: 20.
	0 to: 19 do: [ :i |
		self assert: (color scale: i) class equals: Color ].
	color := NSScale category20b.

	self assert: color range size equals: 20.
	color := NSScale category20c.
	self assert: color range size equals: 20.

	color := NSScale paired12.
	self assert: color range size equals: 12
]

{ #category : #'test - linear' }
NSScaleTest >> testRandom [
	"Random uses NSScale linear"
	| random value |
	random := Random new.
	value := random rsNext: 10.
	self assert: (value between: 0 and: 10).
	value := random rsNext: -10 and: -5.
	self assert: (value between: -10 and: -5 )
]

{ #category : #'test - colors' }
NSScaleTest >> testSetInterpolator [
	| scale |
	scale := NSScale linear
		range: { 'white'. 'black' }.
	self assert: (scale scale: 0.5) equals: Color gray.
	scale interpolate: NSColorHSLAInterpolator.
	self assert: (scale scale: 0.5) equals: Color gray.
	scale interpolate: NSColorHSVAInterpolator.
	self assert: (scale scale: 0.5) equals: Color gray
]
