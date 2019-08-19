Extension { #name : #Random }

{ #category : #'*NumericScales' }
Random >> rsNext: limit [
	^ self rsNext: 0 and: limit.
]

{ #category : #'*NumericScales' }
Random >> rsNext: u and: v [
	^ TSScale linear range: {u. v}; scale: self next.
]
