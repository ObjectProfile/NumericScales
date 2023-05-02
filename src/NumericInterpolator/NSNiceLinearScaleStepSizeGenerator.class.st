"
Nice numbers are just step sizes and used for tick spacing. We will use only niceStep tick
 spaces and place tick marks at multiples of tick spacing.
  
  References:
  	[1] An Extension of Wilkinson's Algorithm for positioning Tick Labels on Axes
  		 				(Justin Talbot, Sharon Lin, Pat Hanrahan)
   [2] Nice Numbers for Graph Labels (Paul S. Heckbert, Graphic Gems I)

Here is an example on how to use it:
-=-=-=-=-=-=-=-=-=
nice := RSNiceStepSizeGenerator new.
lg := RSLabelGenerator nice: nice.

lg setLooseFlag: true.
label := lg searchMin: -98.0 max: 18.0 desired: 3.
label asString
-=-=-=-=-=-=-=-=-=
This prints  '(Score: 0.14) -100.00	-60.00	-20.00	20.00	'
"
Class {
	#name : #NSNiceLinearScaleStepSizeGenerator,
	#superclass : #Object,
	#instVars : [
		'qvar',
		'i',
		'io',
		'j',
		'q',
		'ss',
		'ovar',
		'ssOffMap',
		'resetRequired',
		'base',
		'niceStep',
		'o'
	],
	#category : #'NumericInterpolator-Nice Scaling'
}

{ #category : #accessing }
NSNiceLinearScaleStepSizeGenerator >> base [
	^ base
]

{ #category : #initialization }
NSNiceLinearScaleStepSizeGenerator >> initialize [
	"Generates a NiceNumberGenerator"

	super initialize.
	niceStep := NSNiceLinearScaleStep new.
	o := 0.0.
	self setQ: #(1 5 2 2.5 4 3) base: 10
]

{ #category : #private }
NSNiceLinearScaleStepSizeGenerator >> logB: a [
	^ a ln / base ln
]

{ #category : #public }
NSNiceLinearScaleStepSizeGenerator >> next [
	| oSet |

	niceStep
		stepSize: ss;
		offset: o;
		i: i; "all output and calculations shouls add 1 because wilkinsons index start from 1"
		j: j.
	"Keep track of existing offsets and stepSizes to avoid duplicate returns of
	step size, offset pairs"
	(ssOffMap includesKey: ss) ifTrue: [
		oSet := ssOffMap at: ss.
		[ | b |
			b := oSet includes: o.
			oSet add: o.
			b not and: [io < (ovar size - 1)] ] whileTrue: [
			 io := io +1.
			 niceStep offset: (o := ovar at: io +1 ). ].
		 ] ifFalse: [
		oSet := Set new.
		oSet add: o.
		ssOffMap at: ss put: oSet.
		 ].
	io := io +1."position for next offset if it exists"

	"iterate for next call"
	io < ovar size ifTrue: [ o := ovar at: io +1  ]
	ifFalse: [
		io := 0.
		i := (i< (qvar size - 1) ) ifTrue: [ i+1 ] ifFalse: [ 0 ] .
		j := i = 0 ifTrue: [ j+1 ] ifFalse: [ j ].
		q := self qat: i.
		ss := self stepSize: j q: q.
		ovar := self offsets: j q: q.
		o := ovar at: io + 1.
	].
	resetRequired := true.
	^ niceStep
]

{ #category : #private }
NSNiceLinearScaleStepSizeGenerator >> offsets: tj q: tq [
	| offs |
	offs := Array new: tj.
	(0 to: tj-1) do: [ :ti |
		offs at: ti+1 put: ((tq*ti) raisedTo: (self logB: tj*tq) ) ].
	^ offs
]

{ #category : #private }
NSNiceLinearScaleStepSizeGenerator >> qat: index [
	^ qvar at: index + 1
]

{ #category : #accessing }
NSNiceLinearScaleStepSizeGenerator >> qvar [
	^ qvar
]

{ #category : #initialization }
NSNiceLinearScaleStepSizeGenerator >> reset [
	resetRequired ifFalse: [ ^ self ].
	i := 0.
	io := 0.
	j := 1.
	q := self qat: i.
	ss := self stepSize: j q: q.
	ssOffMap := Dictionary new.
	resetRequired := false
]

{ #category : #initialization }
NSNiceLinearScaleStepSizeGenerator >> setQ: anArray base: aNumber [
	"anArray: preference ordered list of niceStep step sizes.
	The deault is set by the initializer selector

	aNumber: is a number of logs and exps usually changed together with Q"
	qvar := anArray.
	base := aNumber.
	i := 0.
	io := 0.
	j := 1.
	q := self qat: i.
	ss := self stepSize: j q: q.
	ovar := self offsets: j q: q.
	ssOffMap := Dictionary new.
	resetRequired := false
]

{ #category : #private }
NSNiceLinearScaleStepSizeGenerator >> stepSize: tj q: tq [

	^ tj * tq / (base raisedTo: (self logB: tj*tq ) floor )
]
