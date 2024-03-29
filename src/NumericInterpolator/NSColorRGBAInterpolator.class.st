"
I am the interpolator  for colors
"
Class {
	#name : #NSColorRGBAInterpolator,
	#superclass : #NSAbstractInterpolator,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #'color categories' }
NSColorRGBAInterpolator class >> category10 [
	^ self colorHex: #(2062260 16744206 2924588 14034728 9725885 9197131 14907330 8355711 12369186 1556175)
]

{ #category : #'color categories' }
NSColorRGBAInterpolator class >> category20 [
	^ self colorHex: #(2062260 11454440 16744206 16759672 2924588 10018698 14034728 16750742 9725885 12955861 9197131 12885140 14907330 16234194 8355711 13092807 12369186 14408589 1556175 10410725)
]

{ #category : #'color categories' }
NSColorRGBAInterpolator class >> category20b [
	^ self colorHex: #(3750777 5395619 7040719 10264286 6519097 9216594 11915115 13556636 9202993 12426809 15186514 15190932 8666169 11356490 14049643 15177372 8077683 10834324 13528509 14589654)
]

{ #category : #'color categories' }
NSColorRGBAInterpolator class >> category20c [
	^ self colorHex: #(3244733 7057110 10406625 13032431 15095053 16616764 16625259 16634018 3253076 7652470 10607003 13101504 7695281 10394312 12369372 14342891 6513507 9868950 12434877 14277081)
]

{ #category : #helpers }
NSColorRGBAInterpolator class >> colorHex: arr [
	^ arr collect: [ :value | Color colorFrom: (
		(self hex: value >> 16),
		(self hex: value >> 8 & 255),
		(self hex: value & 255))
		 ]
]

{ #category : #interpolation }
NSColorRGBAInterpolator class >> colorInterpolator [
	^ self
]

{ #category : #'color categories' }
NSColorRGBAInterpolator class >> eva10 [
	^ #('A57DBF' '562A65' 'A1DC5C' '46705C' 'B5A7DD' 'F1C123' 'C9783E' '605EA9' '730D0B' '5B5C65')
		collect: [ :s | Color colorFrom: s ]
]

{ #category : #'color categories' }
NSColorRGBAInterpolator class >> google20 [
	^ self colorHex: #(3368652 14432530 16750848 1087000 10027161 39366 14500983 6728192 12070446 3236757 10044569 2271897 11184657 6697932 15102720 9111303 6623335 3314274 5600422 3882668)
]

{ #category : #helpers }
NSColorRGBAInterpolator class >> hex: v [
	^ (v < 16 ifTrue: [ '0' ] ifFalse: [ '' ]), v printStringHex
]

{ #category : #'color categories' }
NSColorRGBAInterpolator class >> paired12 [
	^ self colorHex: #(10931939 2062516 11722634 3383340 16489113 14883356 16629615 16744192 13284054 6962586 16777113 11622696)
]

{ #category : #'color categories' }
NSColorRGBAInterpolator class >> sky8 [
	^ self colorHex: #(13623528 12048360 8895960 14347240 12372694 9280950 6714002 15852509)
]

{ #category : #interpolation }
NSColorRGBAInterpolator >> interpolate: t [
	^ start interpolateTo: stop at: t
]

{ #category : #accessing }
NSColorRGBAInterpolator >> start: anObject [
	start := Color colorFrom: anObject
]

{ #category : #accessing }
NSColorRGBAInterpolator >> stop: anObject [
	stop := Color colorFrom: anObject
]
