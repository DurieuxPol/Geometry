Class {
	#name : #GLineTest,
	#superclass : #TestCase,
	#category : #'Geometry-Tests'
}

{ #category : #tests }
GLineTest >> testCutWith [
	self
		assert: ((GLine a: -20  b: 30  c: -500 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v1
		equals: (-15@(20/3)).
	self
		assert: ((GLine a: -20  b: 30  c: -500 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v2
		equals: ((-5/2)@15).	
	self
		assert: ((GLine a: -30  b: 50  c: -900 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v1 
		equals: (-15 @ 9) .	
	self
		assert: ((GLine a: -30  b: 50  c: -900 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v2 
		equals: (-5 @ 15).
	self
		assert: ((GLine a: 0  b: 1  c: -25 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 ))
		equals: nil.	
]

{ #category : #tests }
GLineTest >> testCutWith2 [

	self
		assert: ((GLine a: 0 b: 1 c: -3) cutWith: (GPolygon newVertices: {
						  (1 @ 5).
						  (1 @ 2).
						  (1 @ 4).
						  (1 @ 1).
						  (3 @ 1).
						  (3 @ 5) })) v2
		equals: 3 @ 3
]

{ #category : #tests }
GLineTest >> testDist [

	self
		assert: ((GLine a: 1 b: 0 c: -7) dist: 7 @ 0)
		equals: 0.
	self
		assert: ((GLine a: 1 b: 0 c: -7) dist: 7 @ 7)
		equals: 0.
	self
		assert: ((GLine a: 1 b: 0 c: -7) dist: 0 @ 0)
		equals: 7.
	self
		assert: ((GLine a: -4 b: 2 c: -3) dist: 2 @ 2)
		equals: 1.5652475842498528
]

{ #category : #tests }
GLineTest >> testEquel [
self
	assert: ((GLine a:1 b:1 c: -13)= (GLine a:6 b:6 c: -78))
	equals: true.
self
	assert: ((GLine a:0 b:1 c: -13)= (GLine a:0 b:6 c: -78))
	equals: true.
self
	assert: ((GLine a:1 b:1 c: -13)= (GLine a:1 b:6 c: -78))
	equals: false.
self
	assert: ((GLine a:1 b:1 c: -13)= (GLine a:6 b:6 c: -7))
	equals: false.
self
	assert: ((GLine a:1 b:0 c: -13)= (GLine a:6 b:0 c: -78))
	equals: true.
self
	assert: ((GLine a:0 b:1 c: 0)= (GLine a:0 b:6 c: 0))
	equals: true.
self
	assert: ((GLine a:1 b:0 c: 0)= (GLine a:1 b:0 c: 0))
	equals: true.

]

{ #category : #tests }
GLineTest >> testEquel1 [
self
	assert: ((GLine a:1 b:1 c: -13)= (GLine a:6 b:6 c: 0))
	equals: false.
self
	assert: ((GLine a:0 b:1 c: -13)= (GLine a:0 b:6 c: -78))
	equals: true.

	
]

{ #category : #tests }
GLineTest >> testEquel2 [
self
	assert: ( ( GLine a: -48.989794855663575 b: 48.98979485566357 c: 4.547473508864641e-13 ) = ( GLine a:
	-138.58803762173304 b: 138.58803762173304 c: 1.8189894035458565e-12 ) )
	equals: true.

]

{ #category : #tests }
GLineTest >> testEquel3 [
self
	assert: ( ( 
	( GSegment with: ( -24.494897427831784 @ -24.494897427831795 ) with: ( 24.494897427831784 @ 24.49489742783178 ) ) asLine
	= (
	( GSegment with: ( -99.30232333601874 @ -99.30232333601876 ) with: ( 39.285714285714285 @ 39.28571428571428 ) ) asLine )
	) )
	equals: true.

]

{ #category : #tests }
GLineTest >> testEquel4 [
self
	assert: ( ( 
	( GSegment with: ( -24.494897427831784 @ -24.494897427831795 ) with: ( 24.494897427831784 @ 24.49489742783178 ) ) asLine
	= (
	( GSegment with: ( 24.494897427831784 @ 24.49489742783178 ) with: ( -24.494897427831784 @ -24.494897427831795 ) ) asLine )
	) )
	equals: true.

]

{ #category : #tests }
GLineTest >> testEquel5 [

	self
		assert: (GLine a: 6000000 b: 6000000 c: 2000000)
			= (GLine a: 0.000006 b: 0.000006 c: 0.000002)
		equals: true.
	self
		assert: (GLine a: 2 b: 5 c: 3) = (GLine a: 2 b: 5 c: 2)
		equals: false.
	self
		assert: (GLine a: 2 b: 5 c: 3) = (GLine a: 1 b: 5 c: 3)
		equals: false.
	self
		assert: (GLine a: 2 b: 5 c: 3) = (GLine a: 2 b: 4 c: 3)
		equals: false.
	self
		assert: (GLine a: 1 b: 0 c: 0) = (GLine a: 6 b: 0 c: 0)
		equals: true.
	self
		assert: (GLine a: 0 b: 0 c: 1) = (GLine a: 0 b: 0 c: 6)
		equals: true.
	self
		assert: (GLine a: 5 b: 4 c: 4) = (GLine a: 0 b: 2 c: 2)
		equals: false.
	self
		assert: (GLine a: 5 b: 4 c: 4) = (GLine a: 2 b: 2 c: 0)
		equals: false.
	self
		assert: (GLine a: 4 b: 0 c: 4) = (GLine a: 2 b: 2 c: 2)
		equals: false
]

{ #category : #tests }
GLineTest >> testEquel6 [

	self
		assert: (GLine a: 1 b: 0 c: 0) = (GLine a: 0 b: 1 c: 0)
		equals: false.
	self
		assert: (GLine a: 1 b: 0 c: 0) = (GLine a: 0 b: 0 c: 1)
		equals: false.
	self
		assert: (GLine a: 0 b: 1 c: 0) = (GLine a: 1 b: 0 c: 0)
		equals: false.
	self
		assert: (GLine a: 0 b: 1 c: 0) = (GLine a: 0 b: 0 c: 1)
		equals: false.
	self
		assert: (GLine a: 0 b: 0 c: 1) = (GLine a: 1 b: 0 c: 0)
		equals: false.
	self
		assert: (GLine a: 0 b: 0 c: 1) = (GLine a: 0 b: 1 c: 0)
		equals: false.
	self
		assert: (GLine a: 0 b: 1 c: 1) = (GLine a: 1 b: 0 c: 0)
		equals: false.
	self
		assert: (GLine a: 1 b: 0 c: 1) = (GLine a: 0 b: 1 c: 0)
		equals: false.
	self
		assert: (GLine a: 1 b: 1 c: 0) = (GLine a: 0 b: 0 c: 1)
		equals: false
]

{ #category : #tests }
GLineTest >> testHasPoint [
"self
	assert: ((GLine a:(-50634/18737)b:(1594971/37474)c: (-183016593/74948)) 
		hasPoint: (57.998905906959145@61.11074842728413) withApproximation: 0.02757564283371476 )
	equals: true."
"self
	assert: ((GSegment with:	((838/41)@(4811/82)) with:((57583/914)@(56095/914))) asLine
		hasPoint: (57.998905906959145@61.11074842728413) withApproximation: 0.02757564283371476 )
	equals: true."
]

{ #category : #tests }
GLineTest >> testHasPoint2 [

self
	assert: ((GSegment with:	((17674/229)@(14582/229)) with:(76.82622578909061@64.97050543967634)) 
			asLine hasPoint: ((-28206/397)@(50382/397)) withApproximation: 0.525738602984892 )
	equals: false.
"self
	assert: ((GSegment with:	((17674/229)@(14582/229)) with:(76.82622578909061@64.97050543967634)) 
			asLine hasPoint: ((9244/147)@(1090/21)) withApproximation: 0.525738602984892 )
	equals: true."
self
	assert: ((GLine a: -2 b: 1 c: -1) hasPoint: 1@3 withApproximation: 0)
	equals: true
]

{ #category : #tests }
GLineTest >> testHash [

	self assert: (GLine a: 1 b: 3 c: -2) hash equals: 242268498.
	self
		deny: (GLine a: 1 b: 3 c: -2) hash
		equals: (GLine a: 1 b: 3 c: 2) hash
]

{ #category : #tests }
GLineTest >> testIntersect [
self
	assert: ((GLine a: 2 b: -3 c: 0.5) intersect: (GLine a: 1 b: 1 c: -2))
	equals: 1.1 @ 0.9
]

{ #category : #tests }
GLineTest >> testIntersect1 [
self
	assert: ((GLine a: 2 b: -3 c: 0.5) intersect: (GLine a: -2 b: -2 c: 4))
	equals: 1.1 @ 0.9
]

{ #category : #tests }
GLineTest >> testParallelTo [
self
	assert: ((GLine a: 0 b: -3 c: 0.5) parallelTo: (GLine a: -2 b: 0 c: 4))
	equals: false.
self
	assert: ((GLine a: 0 b: -3 c: 0.5) parallelTo: (GLine a: -2 b: 1 c: 4))
	equals: false.
self
	assert: ((GLine a: 1 b: 2 c: 0.5) parallelTo: (GLine a: 2 b: 4 c: 4))
	equals: true.
self
	assert: ((GLine a: 0 b: 2 c: 0.5) parallelTo: (GLine a: 0 b: 2 c: 0.5))
	equals: true.
self
	assert: ((GLine a: 1 b: 0 c: 0.5) parallelTo: (GLine a: 2 b: 0 c: 4))
	equals: true
.
self
	assert: ((GLine a: 0 b: 0 c: 0) parallelTo: (GLine a: 0 b: 0 c: 0))
	equals: true
]

{ #category : #tests }
GLineTest >> testPointsWithDist1To [

	self
		assert: ((GLine a: -1 b: 1 c: 0) pointsWithDist: 2 to: 1 @ 1)
		equals: {
				(2.414213562373095 @ 2.414213562373095).
				(-0.4142135623730949 @ -0.4142135623730949) }.
	self
		assert: ((GLine a: -2 b: 3 c: 0) pointsWithDist: 2 to: 3 @ 2)
		equals: {
				(4.664100588675687 @ 3.1094003924504583).
				(1.3358994113243126 @ 0.8905996075495417) }.
	self
		assert: ((GLine a: 1 b: 0 c: -2) pointsWithDist: 2 to: 2 @ 1)
		equals: {
				(2 @ 3).
				(2 @ -1) }
]

{ #category : #tests }
GLineTest >> testPointsWithDistTo [

	self
		assert: ((GLine a: -1 b: 1 c: 0) pointsWithDist1: 2 to: 1 @ 1)
		equals: {
				(2.414213562373095 @ 2.414213562373095).
				(-0.4142135623730949 @ -0.4142135623730949) }.
	self
		assert: ((GLine a: -2 b: 3 c: 0) pointsWithDist1: 2 to: 3 @ 2)
		equals: {
				(4.664100588675687 @ 3.1094003924504583).
				(1.3358994113243126 @ 0.8905996075495417) }.
	self
		assert: ((GLine a: 1 b: 0 c: -2) pointsWithDist1: 2 to: 2 @ 1)
		equals: {
				(2 @ 3).
				(2 @ -1) }
]

{ #category : #tests }
GLineTest >> testPointsWithDistToRaiseError [

	self
		should: [ (GLine a: -2 b: 1 c: 0) pointsWithDist: 2 to: 1 @ 1 ]
		raise: Error
]

{ #category : #tests }
GLineTest >> testPrintOn [

	self
		assert:
		(String streamContents: [ :s | (GLine a: 1 b: 2 c: 3) printOn: s ])
		equals: '1x +2y +3 = 0'.
	self
		assert:
		(String streamContents: [ :s | (GLine a: 1 b: 0 c: 0) printOn: s ])
		equals: '1x +0y +0 = 0'.
	self
		assert:
		(String streamContents: [ :s | (GLine a: 1 b: -2 c: -3) printOn: s ])
		equals: '1x -2y -3 = 0'
]

{ #category : #tests }
GLineTest >> testThroughAnd [

	| l1 l2 |
	l1 := GLine through: 2 @ 3 and: 3 @ 3.
	l2 := GLine through: 2 @ 2 and: 2 @ 3.
	self assert: l1 equals: (GLine a: 0 b: 1 c: -3).
	self assert: l2 equals: (GLine a: 1 b: 0 c: -2)
]

{ #category : #tests }
GLineTest >> testThroughAndHasPoint [
self
	assert: ((GLine through: 1@1 and: 3@3)through: 1@1 and: 3@3 hasPoint: 2@2 )
	equals: true.
self
	assert: ((GLine through: 1@1 and: 2@2)through: 1@1 and: 2@2 hasPoint: 3@3 )
	equals: true.
self
	assert: ((GLine through: 1@1 and: 2@2)through: 1@1 and: 2@2 hasPoint: 2@1 )
	equals: false.
]

{ #category : #tests }
GLineTest >> testXFor [

	self assert: ((GLine a: -3 b: 1 c: 0) xFor: 3) equals: 1.
	self assert: ((GLine a: -3 b: 2 c: 0) xFor: 3) equals: 2.
	self assert: ((GLine a: -3 b: 1 c: 2) xFor: 1) equals: 1
]

{ #category : #tests }
GLineTest >> testYFor [

	self assert: ((GLine a: -3 b: 1 c: 0) yFor: 1) equals: 3.
	self assert: ((GLine a: -3 b: 2 c: 0) yFor: 2) equals: 3.
	self assert: ((GLine a: -3 b: 1 c: 2) yFor: 1) equals: 1
]
