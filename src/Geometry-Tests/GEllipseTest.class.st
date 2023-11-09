Class {
	#name : #GEllipseTest,
	#superclass : #TestCase,
	#category : #'Geometry-Tests'
}

{ #category : #tests }
GEllipseTest >> testEncompassingRectangle [
	self
		assert: (GEllipse center: 2 @ 2 a: 3 b: 2) encompassingRectangle
		equals: (-1 @ 0 corner: 5 @ 4)
]

{ #category : #tests }
GEllipseTest >> testEquals [
	self
		assert: (GEllipse center: 10 @ 10 a: 5 b: 10)
		equals: (GEllipse center: 10 @ 10 a: 5 b: 10).
	self
		assert: (GEllipse center: 10 @ 10 a: 5 b: 10) hash
		equals: (GEllipse center: 10 @ 10 a: 5 b: 10) hash
]

{ #category : #tests }
GEllipseTest >> testHash [

	self
		assert: (GEllipse center: 10 @ 10 a: 5 b: 10) hash
		equals: 17696867
]

{ #category : #tests }
GEllipseTest >> testIntersectLineSegment [

	self
		assert: ((GEllipse center: 0 @ 0 a: 3 b: 2) intersectLineSegment:
				 (GLineSegment from: 0 @ 0 to: 0 @ 3))
		equals: {
				(0 @ -2).
				(0 @ 2) } asOrderedCollection
]

{ #category : #tests }
GEllipseTest >> testNotEquals [

	self
		deny: (GCircle center: 2 @ 2 radius: 3)
		equals: (GEllipse center: 5 @ 5 a: 2 b: 3).
	self
		deny: (GEllipse center: 10 @ 10 a: 5 b: 10)
		equals: (GEllipse center: 5 @ 5 a: 2 b: 3).
	self
		deny: (GEllipse center: 10 @ 10 a: 5 b: 10) hash
		equals: (GEllipse center: 5 @ 5 a: 2 b: 3) hash
]
