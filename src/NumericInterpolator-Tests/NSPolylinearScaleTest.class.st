"
A NSPolylinearScaleTest is a test class for testing the behavior of NSPolylinearScale
"
Class {
	#name : #NSPolylinearScaleTest,
	#superclass : #TestCase,
	#category : #'NumericInterpolator-Tests'
}

{ #category : #'test - linear' }
NSPolylinearScaleTest >> testScalePolyLinear [
	| linear |
	linear := NSScale linear
		domain: #(0 0.5 1);
		range: #(10 80 10).
	self
		assert: linear input class equals: NSPolylinearScale;
		assert: linear output class equals: NSPolylinearScale;
		assert: (linear scale: 0) equals: 10;
		assert: (linear scale: 0.5) equals: 80;
		assert: (linear scale: 1) equals: 10;
		assert: (linear scale: 1.5) equals: -60.
	linear := NSScale linear
		domain: #(0 0.5 1);
		range: #('white' 'black' 'white').
	self 
		assert: (linear scale: 0) equals: Color white;
		assert: (linear scale: 0.25) equals: Color gray;
		assert: (linear scale: 0.75) equals: Color gray.
	
	
	
]
