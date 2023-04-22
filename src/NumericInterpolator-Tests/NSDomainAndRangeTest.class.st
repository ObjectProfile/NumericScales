Class {
	#name : #NSDomainAndRangeTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'scale'
	],
	#category : #'NumericInterpolator-Tests'
}

{ #category : #'building suites' }
NSDomainAndRangeTest class >> testParameters [

	^ ParametrizedTestMatrix new
		  addCase: { (#scale -> NSLinearScale new) };
		  addCase: { (#scale -> NSLogScale new) };
		  addCase: { (#scale -> NSLnScale new) };
		  addCase: { (#scale -> NSSymLogScale new) };
		  addCase: { (#scale -> NSPowScale new) };
		  yourself
]

{ #category : #tests }
NSDomainAndRangeTest >> scale [

	^ scale
]

{ #category : #tests }
NSDomainAndRangeTest >> scale: aScale [

	scale := aScale
]

{ #category : #running }
NSDomainAndRangeTest >> setUp [

	super setUp.
	scale
		domain: { 1. 70000 };
		range: { 1. 2 }
]

{ #category : #tests }
NSDomainAndRangeTest >> testInvertRange [

	self assert: scale domain first closeTo: (scale invert: scale range first).
	self assert: scale domain second closeTo: (scale invert: scale range second)
]

{ #category : #tests }
NSDomainAndRangeTest >> testScaleDomain [

	self assert: scale range first closeTo: (scale scale: scale domain first).
	self assert: scale range second closeTo: (scale scale: scale domain second)
]
