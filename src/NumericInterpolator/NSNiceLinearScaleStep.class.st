"
I am an utility class for RTNiceStepSizeGenerator>>next

"
Class {
	#name : #NSNiceLinearScaleStep,
	#superclass : #RSObject,
	#instVars : [
		'stepSize',
		'offset',
		'i',
		'j'
	],
	#category : #'NumericInterpolator-Nice Scaling'
}

{ #category : #accessing }
NSNiceLinearScaleStep >> i [
	^ i
]

{ #category : #accessing }
NSNiceLinearScaleStep >> i: aNumber [
	i := aNumber
]

{ #category : #accessing }
NSNiceLinearScaleStep >> j [
	^ j
]

{ #category : #accessing }
NSNiceLinearScaleStep >> j: aNumber [
	j := aNumber
]

{ #category : #accessing }
NSNiceLinearScaleStep >> offset [
	^ offset
]

{ #category : #accessing }
NSNiceLinearScaleStep >> offset: aNumber [
	offset := aNumber
]

{ #category : #accessing }
NSNiceLinearScaleStep >> stepSize [
	^ stepSize
]

{ #category : #accessing }
NSNiceLinearScaleStep >> stepSize: aNumber [
	stepSize := aNumber
]
