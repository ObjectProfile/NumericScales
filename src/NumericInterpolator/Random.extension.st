Extension { #name : #Random }

{ #category : #'*NumericInterpolator' }
Random >> rsNext: limit [
	^ self rsNext: 0 and: limit.
]

{ #category : #'*NumericInterpolator' }
Random >> rsNext: u and: v [
	^ TSScale linear range: {u. v}; scale: self next.
]
