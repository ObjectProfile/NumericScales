"
I am a common scale interpolator, just put your entry value and this objects scale and return the value in your domain.
I am inspired in the d3 implementation of scales you can find the source code in https://github.com/d3/d3-scale

Here is an example:
-=-=-=
s := NSScale linear.
s range: { 5 . 10 }.
s scale: 0. ""=> 5""
s scale: 0.5. ""=> 7.5""
s scale: 1. ""=> 10""
-=-=-=

"
Class {
	#name : #NSScale,
	#superclass : #Object,
	#instVars : [
		'domain',
		'range',
		'interpolate',
		'uninterpolate'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #colors }
NSScale class >> category10 [
	^ self fromColorCategory: #category10
]

{ #category : #colors }
NSScale class >> category20 [
	^ self fromColorCategory: #category20
]

{ #category : #colors }
NSScale class >> category20b [
	^ self fromColorCategory: #category20b
]

{ #category : #colors }
NSScale class >> category20c [
	^ self fromColorCategory: #category20c
]

{ #category : #colors }
NSScale class >> eva10 [
	^ self fromColorCategory: #eva10
]

{ #category : #colors }
NSScale class >> fromColorCategory: symbol [
	^ self ordinal 
		range: (NSColorRGBAInterpolator perform: symbol);
		yourself
]

{ #category : #colors }
NSScale class >> google20 [
	^ self fromColorCategory: #google20
]

{ #category : #'instance creation' }
NSScale class >> linear [
	^ NSLinearScale new. 
]

{ #category : #'instance creation' }
NSScale class >> log [
	^ NSLogScale new
]

{ #category : #'instance creation' }
NSScale class >> ordinal [
"Define an ordinal scale. Here is an example:

v := RSView new.
colors := TSScale ordinal range: { Color red . Color yellow . Color blue }.
boxes := RSShapeBuilder box
				size: 20;
				color: [ :vv | colors scale: vv ];
				elementsOn: ((1 to: 10) collect: [:vv | vv // 2 ]) shuffled.
v addAll: boxes.
RSHorizontalLineLayout new gapSize: 0; on: boxes.
v @ RSControlsView.
v open
"
	^ NSOrdinalScale new 
]

{ #category : #colors }
NSScale class >> paired12 [
	^ self fromColorCategory: #paired12
]

{ #category : #'instance creation' }
NSScale class >> pow [
	^ NSPowScale new
]

{ #category : #colors }
NSScale class >> sky8 [
	^ self fromColorCategory: #sky8
]

{ #category : #'instance creation' }
NSScale class >> sqrt [
	^ self pow
		exponent: 0.5; 
		yourself
]

{ #category : #'instance creation' }
NSScale class >> symlog [
	^ NSSymLogScale new
]

{ #category : #accessing }
NSScale >> domain [
	^ domain
]

{ #category : #accessing }
NSScale >> domain: aTwoArrayAsNumbers [
	"Define the domain of the input values. Values provided to scale: should be within the domain
	For example
	-=-=-=
	s := TSScale linear.
	s domain: { -1 . 1 }.
	s range: { 5 . 10 }.
	s scale: 0
	-=-=-=
	Return 7.5
	"
	domain := aTwoArrayAsNumbers
]

{ #category : #accessing }
NSScale >> from [
	^ self range first
]

{ #category : #accessing }
NSScale >> from: value [
	self range: { value. self range last }.
]

{ #category : #accessing }
NSScale >> interpolate [
	^ interpolate
]

{ #category : #accessing }
NSScale >> interpolate: anObject [
	interpolate := anObject.
]

{ #category : #transformation }
NSScale >> invert: anObject [
	"This is the inverse of scale"
	self subclassResponsibility.
]

{ #category : #accessing }
NSScale >> range [
	^ range
]

{ #category : #accessing }
NSScale >> range: aTwoArrayOfNumbers [
	"Expect an array of two numbers.
	A range defines the range of the scaled value.
	
	For example:
	-=-=-=
	s := TSScale linear.
	s range: { 5 . 10 }.
	s scale: 0.5 
	-=-=-=
	Return 7.5
	"
	
	range := aTwoArrayOfNumbers
]

{ #category : #hooks }
NSScale >> rescale [
	self subclassResponsibility
]

{ #category : #transformation }
NSScale >> rsValue: obj [
	^ self scale: obj
]

{ #category : #transformation }
NSScale >> scale: anObject [
	"do you have your domain, and your range? ok so use this method in one of my subclasses"
	self subclassResponsibility
]

{ #category : #accessing }
NSScale >> to [
	^ self range last
]

{ #category : #accessing }
NSScale >> to: value [
	self range: { self range first. value }.
]

{ #category : #accessing }
NSScale >> uninterpolate [
	^ uninterpolate
]

{ #category : #accessing }
NSScale >> uninterpolate: anObject [
	uninterpolate := anObject
]
