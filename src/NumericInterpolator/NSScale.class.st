"
<keyClass>
`NSScale` is a common scale interpolator. It transformes numerical or ordinal values using a range and a domain. A scale maps _a domain to a range_. `NSScale` offers several scales as class side methods. The code of the scales are inspired from https://github.com/d3/d3-scale

*Responsibility*: act as a scale interpolator for numerical and ordinal values.

*Collaborators*: `NSScale` depends on a number of Pharo packages, including `Colors`, `Random-Core`. The scales are intensively used by Roassal

*Variables*:
- `range`: an array of two or more values to which the domain is mapped to. The range variable defines the range of the scaled value. A range may contains values or colors.
- `domain`: an array of values that maps to a range

*Example*:
```Smalltalk
s := NSScale linear.
s range: { 5 . 10 }.
s scale: 0. ""=> 5""
s scale: 0.5. ""=> 7.5""
s scale: 1. ""=> 10""
```

```Smalltalk
s := NSScale linear.
s domain: { -1 . 1 }.
s range: { 5 . 10 }.
s scale: 0.5
```

```Smalltalk
s := NSScale linear.
s range: { Color white . Color black }.
s scale: 0.5  ""=> Color gray""
```

Here is a larger example:
```
sc := NSScale linear 
	range: { #white . #gray . #red };
	domain: { 0 . 1 . 2}.

ss := NSScale linear 
	range: { 80 . 30 . 80 };
	domain: { 0 . 1 . 2}.
	 
c := RSCanvas new.
0 to: 2 by: 0.1 do: [ :i |
	s := RSBox new width: 30; height: (ss scale: i); model: i; color: (sc scale: i).
	c add: s ].

RSHorizontalLineLayout on: c shapes.
c @ RSCanvasController.
c open
```

Another example using ordinal scale:
```Smalltalk
c := RSCanvas new.
colors := NSScale ordinalColored: 3.

r := Random seed: 42.
100 timesRepeat: [ 
	txt := { 'hello' . 'bonjour' . 'Guten Morgen' } atRandom: r.
	g := RSGroup new.
	g add: (RSBox new width: 130; height: 20; model: txt; color: (colors scale: txt)).
	g add: (RSLabel new text: txt).
	c add: g asShape.
	 ].

RSGridLayout new lineItemsCount: 5; on: c shapes.
c @ RSCanvasController.
c open
```
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
		range: ( symbol value: NSColorRGBAInterpolator);
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
NSScale class >> ln [
	^ NSLnScale new
]

{ #category : #'instance creation' }
NSScale class >> log [
	^ NSLogScale new
]

{ #category : #'instance creation' }
NSScale class >> ordinal [
"Define an ordinal scale.

Example:
```Smalltalk
c := RSCanvas new.
colors := NSScale ordinal range: { Color red translucent . Color yellow translucent . Color blue translucent }.

r := Random seed: 42.
100 timesRepeat: [
	txt := { 'hello' . 'bonjour' . 'Guten Morgen' } atRandom: r.
	g := RSGroup new.
	g add: (RSBox new width: 130; height: 20; model: txt; color: (colors scale: txt)).
	g add: (RSLabel new text: txt).
	c add: g asShape.
	 ].

RSGridLayout new lineItemsCount: 5; on: c shapes.
c @ RSCanvasController.
c open
```
"
	^ NSOrdinalScale new
]

{ #category : #'instance creation' }
NSScale class >> ordinalColored: numberOfBuckets [
"Define an ordinal scale for colors. It accepts the number of allocated buckets.

Example:
```Smalltalk
c := RSCanvas new.
colors := NSScale ordinalColored: 3.

r := Random seed: 42.
100 timesRepeat: [
	txt := { 'hello' . 'bonjour' . 'Guten Morgen' } atRandom: r.
	g := RSGroup new.
	g add: (RSBox new width: 130; height: 20; model: txt; color: (colors scale: txt)).
	g add: (RSLabel new text: txt).
	c add: g asShape.
	 ].

RSGridLayout new lineItemsCount: 5; on: c shapes.
c @ RSCanvasController.
c open
```
"
	^ self ordinal range: (Color wheel: numberOfBuckets saturation: 0.4 brightness: 1.0)
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
	s := NSScale linear.
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
	self range: { value. self range last }
]

{ #category : #accessing }
NSScale >> interpolate [
	^ interpolate
]

{ #category : #accessing }
NSScale >> interpolate: anObject [
	interpolate := anObject
]

{ #category : #transformation }
NSScale >> invert: anObject [
	"This is the inverse of scale"
	self subclassResponsibility
]

{ #category : #accessing }
NSScale >> niceScale: numberOfTicks [

	^ self
]

{ #category : #printing }
NSScale >> printOn: stream [
	super printOn: stream.
	stream << '('.
	self domain printOn: stream.
	stream << ', '.
	self range printOn: stream.
	stream << ')'
]

{ #category : #accessing }
NSScale >> range [
	"Return the array of values to which the domain is mapped to"
	^ range
]

{ #category : #accessing }
NSScale >> range: someValues [
	"Expect an array of two or more values.
This is to what a domain is mapped to.

For example:
```
s := NSScale linear.
s range: { 5 . 10 }.
s scale: 0.5
```
Return 7.5

Another example:
```
s := NScale linear
	range: { #white . #gray . #red };
	domain: { 0 . 1 . 2}.
s scale: 1.5.
``
Return a gray-red color`
"

	range := someValues
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
	self range: { self range first. value }
]

{ #category : #accessing }
NSScale >> uninterpolate [
	^ uninterpolate
]

{ #category : #accessing }
NSScale >> uninterpolate: anObject [
	uninterpolate := anObject
]
