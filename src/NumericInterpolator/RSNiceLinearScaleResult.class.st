"
I am an utility class for RSLabelGenerator.

-=-=-=-=-=-=-=-=-=
values := #(1 2.3 4.3).
c := RSChart new.
d := RSScatterPlot new x: values y: values.
c addPlot: d.
c addDecoration: RSHorizontalTick new.

tick := RSVerticalTick new.
c addDecoration: tick.
c build.

tick createNiceLabelIn: c 
-=-=-=-=-=-=-=-=-=

prints the following: ""(Score: 0.75) 1.00	2.00	3.00	4.00	5.00	""
					
The min and max represents the range of the ticks
"
Class {
	#name : #RSNiceLinearScaleResult,
	#superclass : #Object,
	#instVars : [
		'min',
		'max',
		'step',
		'score'
	],
	#category : #'NumericInterpolator-Nice Scaling'
}

{ #category : #initialization }
RSNiceLinearScaleResult >> initialize [
	super initialize.
	score := 0
]

{ #category : #accessing }
RSNiceLinearScaleResult >> max [
	^ max
]

{ #category : #accessing }
RSNiceLinearScaleResult >> max: aNumber [
	max := aNumber
]

{ #category : #accessing }
RSNiceLinearScaleResult >> min [
	^ min
]

{ #category : #accessing }
RSNiceLinearScaleResult >> min: aNumber [
	min := aNumber
]

{ #category : #accessing }
RSNiceLinearScaleResult >> numberOfTicks [
	^ self ticks / step
]

{ #category : #printing }
RSNiceLinearScaleResult >> printOn: aStream [
	| x |
	aStream
		nextPutAll: '(Score: ';
		nextPutAll: (score printShowingDecimalPlaces: 2);
		nextPutAll: ') '.
	x := min.
	[x <= max ] whileTrue: [
		aStream nextPutAll: (x printShowingDecimalPlaces: 2).
		aStream nextPutAll: String tab.
		x := x + step ]
]

{ #category : #accessing }
RSNiceLinearScaleResult >> score [
	^ score
]

{ #category : #accessing }
RSNiceLinearScaleResult >> score: aNumber [
	score := aNumber
]

{ #category : #accessing }
RSNiceLinearScaleResult >> step [
	^ step
]

{ #category : #accessing }
RSNiceLinearScaleResult >> step: aNumber [
	step := aNumber
]

{ #category : #accessing }
RSNiceLinearScaleResult >> ticks [
	^  min < 0 ifTrue: [
		 max < 0
			ifTrue: [ (max - min) abs ]
			ifFalse: [ max + min abs  ]
	] ifFalse: [ max - min ]
]
