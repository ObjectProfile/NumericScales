"
I am the basic uninterpolator, my subclasses are

TSUninterpolateClamp
TSUninterpolateNumber
"
Class {
	#name : #TSUninterpolate,
	#superclass : #TSObject,
	#instVars : [
		'a',
		'b'
	],
	#category : #'NumericScales-Core'
}

{ #category : #interpolating }
TSUninterpolate class >> uninterpolate: aNum1 and: aNum2 [
	^ self new uninterpolate: aNum1 and: aNum2.
	
]

{ #category : #accessing }
TSUninterpolate >> stopValue: aNum1 stop: aNum2 [
	aNum1 isZero ifFalse: [ ^ aNum1 ].
	aNum2 isZero ifTrue: [ ^ Float infinity ].
	^ 1 / aNum2
]

{ #category : #interpolating }
TSUninterpolate >> uninterpolate: x [
	self subclassResponsibility.
]

{ #category : #accessing }
TSUninterpolate >> uninterpolate: aNum1 and: aNum2 [
	a := aNum1.
	b := aNum2.
	(a isPoint or: [ b isPoint ]) ifTrue: [ 
		| b2 |
		a := a asPoint.
		b2 := b := b asPoint.
		b := b - a.
		b := (self stopValue: b x stop: b2 x ) @ b y.
		b := b x @ (self stopValue: b y stop: b2 y).
		^ self  ].
	a isNumber 
		ifFalse: [ ^ a := b := Float nan. ].
	b  := b - a.
	b := self stopValue: b stop: aNum2.
	
]