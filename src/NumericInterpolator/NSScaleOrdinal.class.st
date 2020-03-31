"
I am a scale for ordinal ranges
"
Class {
	#name : #NSScaleOrdinal,
	#superclass : #NSScale,
	#instVars : [
		'ranger',
		'dictionary',
		'argument',
		'rangeBand'
	],
	#category : #'NumericInterpolator-Scales'
}

{ #category : #accessing }
NSScaleOrdinal >> dictionary [ 
	^ dictionary 
]

{ #category : #accessing }
NSScaleOrdinal >> domain: arr [
	domain := OrderedCollection new.
	dictionary := Dictionary new.
	arr do: [ :xi |
		(dictionary includesKey: xi) ifFalse: [ 
			domain add: xi.
			dictionary at: xi put: domain size ] ].
	self perform: ranger withArguments: argument
]

{ #category : #initialization }
NSScaleOrdinal >> initialize [
	super initialize.
	ranger := #range:.
	argument := #( #() ).
	self domain: #().
	
	
]

{ #category : #transformation }
NSScaleOrdinal >> invert: anObject [
	self shouldNotImplement
]

{ #category : #accessing }
NSScaleOrdinal >> range: x [
	range := x.
	rangeBand := 0.
	ranger := #range:.
	argument := Array with: x.
]

{ #category : #accessing }
NSScaleOrdinal >> rangeBand [
	^ rangeBand
]

{ #category : #public }
NSScaleOrdinal >> rangeBands: x [
	self rangeBands: x padding: 0
]

{ #category : #public }
NSScaleOrdinal >> rangeBands: x padding: padding [
	self rangeBands: x padding: padding outerPadding: padding
]

{ #category : #public }
NSScaleOrdinal >> rangeBands: x padding: padding outerPadding: outerPadding [
	| start stop step reverse |
	start := x first.
	stop := x second.
	reverse := false.
	start > stop ifTrue: [| t |
		t := start. start := stop. stop := t.
		reverse := true. ].
	step := (stop - start) / (domain size - padding + (2*outerPadding)).
	
	range := self 
		steps: start + (step * outerPadding)
		and: step.
	reverse ifTrue: [ range := range reverse ].
	rangeBand := step * (1 - padding).
	ranger := #rangeBands:padding:outerPadding:.
	argument := Array with: x with: padding with: outerPadding
]

{ #category : #accessing }
NSScaleOrdinal >> rangeExtent [
	^ self scaleExtent: argument first
]

{ #category : #accessing }
NSScaleOrdinal >> rangeFrom: array [
	self range: (array collect: [ :val | Color colorFrom: val ])
]

{ #category : #public }
NSScaleOrdinal >> rangePoints: x [
	self rangePoints: x padding: 0
]

{ #category : #public }
NSScaleOrdinal >> rangePoints: x padding: padding [
	| start stop step |
	start := x first.
	stop := x second.
	step := domain size < 2
		ifTrue: [ start := (start  + stop)/2. 0 ]
		ifFalse: [ (stop - start)/(domain size - 1 + padding) ].
	range := self 
		steps: start + (step * padding / 2)
		and: step.
	rangeBand := 0.
	
	ranger := #rangePoints:padding:.
	argument := Array with: x with: padding
]

{ #category : #public }
NSScaleOrdinal >> rangeRoundBands: x [
	self rangeRoundBands: x padding: 0
]

{ #category : #public }
NSScaleOrdinal >> rangeRoundBands: x padding: padding [
	self rangeRoundBands: x padding: padding outerPadding: padding
]

{ #category : #public }
NSScaleOrdinal >> rangeRoundBands: x padding: padding outerPadding: outerPadding [
	| start stop step reverse |
	start := x first.
	stop := x second.
	reverse := false.
	start > stop ifTrue: [| t |
		t := start. start := stop. stop := t.
		reverse := true. ].
	step := ((stop - start) / (domain size - padding + (2*outerPadding))) floor.
	
	range := self 
		steps: start + ( (stop - start - ((domain size - padding) * step) ) / 2 ) rounded
		and: step.
	reverse ifTrue: [ range := range reverse ].
	rangeBand := (step * (1 - padding)) rounded.
	ranger := #rangeRoundBands:padding:outerPadding:.
	argument := Array with: x with: padding with: outerPadding
]

{ #category : #public }
NSScaleOrdinal >> rangeRoundPoints: x [
	self rangeRoundPoints: x padding: 0
]

{ #category : #public }
NSScaleOrdinal >> rangeRoundPoints: x padding: padding [
	| start stop step |
	start := x first.
	stop := x second.
	step := domain size < 2
		ifTrue: [ start := stop := ((start + stop)/2) rounded. 0 ]
		ifFalse: [[ (stop - start)/(domain size -1 + padding)]
			on: Error do: [ :ex | 0 ] ].
		
	range := self 
		steps: start + ((step * padding / 2) + (stop - start - 
			((domain size - 1 + padding)* step) )/ 2) rounded
		and: step.
	rangeBand := 0.
	ranger := #rangeRoundPoints:padding:.
	argument := Array with: x with: padding
]

{ #category : #transformation }
NSScaleOrdinal >> scale: x [
	| index |
	index := dictionary at: x ifAbsent: [ nil ].
	(index isNil and: [ ranger = #range:]) ifTrue: [
		domain add: x.
		dictionary at: x put: (index := domain size).
		].
	index ifNil: [ self error: 'invalid input' ].
	index := index % range size.
	index isZero 
		ifTrue: [ index := range size ].
	^ range at: index
]

{ #category : #helpers }
NSScaleOrdinal >> scaleExtent: d [
	| start stop |
	start := d first.
	stop := d last.
	^ start < stop
		ifTrue: [ Array with: start with: stop ]
		ifFalse: [ Array with: stop with: start ]
]

{ #category : #helpers }
NSScaleOrdinal >> steps: start and: step [
	^ (0 to: domain size - 1) collect: [ :i | (start + (step * i)) asFloat ].
]