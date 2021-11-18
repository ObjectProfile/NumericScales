"
A NSOrdinalScaleTest is a test class for testing the behavior of NSOrdinalScale
"
Class {
	#name : #NSOrdinalScaleTest,
	#superclass : #TestCase,
	#category : #'NumericInterpolator-Tests'
}

{ #category : #running }
NSOrdinalScaleTest >> classToTest [
	^ NSOrdinalScale
]

{ #category : #'test - scales' }
NSOrdinalScaleTest >> testOrdinalScale [
	| ordinal |
	ordinal := self classToTest new
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		range: #(10 20 30 40 50 60).
	self 
		assert: (ordinal scale: 'a') equals: 10;
		assert: (ordinal scale: 'd') equals: 40;
		assert: (ordinal scale: 'f') equals: 60
		
]

{ #category : #'test - scales' }
NSOrdinalScaleTest >> testOrdinalScaleRangeBands [
	| ordinal |
	ordinal := self classToTest new
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		rangeBands: #(0 960).
	self 
		assert: ordinal rangeBand equals: 160;
		assert: (ordinal scale: 'a') equals: 0;
		assert: (ordinal scale: 'd') equals: 480;
		assert: (ordinal scale: 'f') equals: 800;
		
		assert: ordinal rangeExtent equals: #(0 960)
		
]

{ #category : #'test - scales' }
NSOrdinalScaleTest >> testOrdinalScaleRangePoints [
	| ordinal |
	ordinal := self classToTest new
		domain: #('apple' 'orange' 'banana' 'grape');
		rangePoints: #(0 960).
	self 
		assert: (ordinal scale: 'apple') equals: 0;
		assert: (ordinal scale: 'orange') equals: 320;
		assert: (ordinal scale: 'grape') equals: 960;
		
		assert: ordinal rangeExtent equals: #(0 960)
	
		
]

{ #category : #'test - scales' }
NSOrdinalScaleTest >> testOrdinalScaleRangeRoundBands [
	| ordinal |
	ordinal := self classToTest new
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		rangeRoundBands: #(0 960) padding: 0.1.
	self 
		assert: ordinal rangeBand equals: 141;
		assert: (ordinal scale: 'a') equals: 17;
		assert: (ordinal scale: 'd') equals: 488;
		assert: (ordinal scale: 'f') equals: 802;
		assert: ordinal rangeExtent equals: #(0 960).
		
	ordinal := NSScale ordinal
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		rangeRoundBands: #(0 960).
	self 
		assert: ordinal rangeBand equals: 160;
		assert: (ordinal scale: 'a') equals: 0;
		assert: (ordinal scale: 'd') equals: 480;
		assert: (ordinal scale: 'f') equals: 800;
		assert: ordinal rangeExtent equals: #(0 960)
]

{ #category : #'test - scales' }
NSOrdinalScaleTest >> testOrdinalScaleRangeRoundPoints [
	| ordinal |
	ordinal := self classToTest new
		domain: #(1 2 3 4);
		rangeRoundPoints: #(0 100).
	self 
		assert: ordinal rangeBand equals: 0;
		assert: (ordinal scale: 1) equals: 0;
		assert: (ordinal scale: 2) equals: 33.333333333333333;
		assert: (ordinal scale: 4) equals: 100
	
]
