Extension { #name : #Color }

{ #category : #'*NumericInterpolator' }
Color >> interpolateTo: anObject at: t [
	| start stop |
	anObject isColor ifFalse: [ ^ anObject interpolateTo: self at: 1 - t  ].
	start := self.
	stop := anObject.
	^ self class
		r: start red + ((stop red - start red) * t)
		g: start green + ((stop green - start green)  * t)
		b: start blue + ((stop blue - start blue) * t)
		alpha: start alpha + ((stop alpha - start alpha) * t)
]
