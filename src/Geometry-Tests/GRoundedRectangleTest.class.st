Class {
	#name : #GRoundedRectangleTest,
	#superclass : #TestCase,
	#category : #'Geometry-Tests'
}

{ #category : #tests }
GRoundedRectangleTest >> testCenter [

	self
		assert: (GRoundedRectangle
				 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 1)
				 borderRadius: 0.5) center
		equals: 0 @ 0
]

{ #category : #tests }
GRoundedRectangleTest >> testCorners [
	| rect |
	rect := GRoundedRectangle
		rectangle: (GRectangle origin: -40 @ -20 corner: 40 @ 20)
		borderRadius: 10.
	self
		assert: rect corners
		equals:
			(Array
				with:
					(GCircleArc
						center: 30 @ -10
						radius: 10
						startAngle: 0
						endAngle: Float halfPi)
				with:
					(GCircleArc
						center: -30 @ -10
						radius: 10
						startAngle: Float halfPi
						endAngle: Float pi)
				with:
					(GCircleArc
						center: -30 @ 10
						radius: 10
						startAngle: Float pi
						endAngle: Float threePi / 2)
				with:
					(GCircleArc
						center: 30 @ 10
						radius: 10
						startAngle: Float threePi / 2
						endAngle: Float twoPi))
]

{ #category : #tests }
GRoundedRectangleTest >> testEncompassingRectangle [

	| rect |
	rect := GRoundedRectangle
		        rectangle: (GRectangle origin: -40 @ -20 corner: 40 @ 20)
		        borderRadius: 10.
	self
		assert: (GRoundedRectangle
				 rectangle: (GRectangle origin: -40 @ -20 corner: 40 @ 20)
				 borderRadius: 10) encompassingRectangle
		equals: (GRectangle origin: -40 @ -20 corner: 40 @ 20)
]

{ #category : #tests }
GRoundedRectangleTest >> testEqual [

	self
		assert: (GRoundedRectangle
				 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 1)
				 borderRadius: 0.5)
		equals: (GRoundedRectangle
				 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 1)
				 borderRadius: 0.5).
	self
		deny: (GRoundedRectangle
				 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 1)
				 borderRadius: 0.5)
		equals: (GRoundedRectangle
				 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 1)
				 borderRadius: 1).
	self
		deny: (GRoundedRectangle
				 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 1)
				 borderRadius: 0.5)
		equals: (GRoundedRectangle
				 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 2)
				 borderRadius: 0.5).
	self
		deny: (GRoundedRectangle
				 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 1)
				 borderRadius: 0.5)
		equals: (GRoundedRectangle
				 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 2)
				 borderRadius: 1).
	self deny: (GRoundedRectangle
			 rectangle: (GRectangle origin: -2 @ -1 corner: 2 @ 1)
			 borderRadius: 0.5) = (Rectangle origin: -2 @ -1 corner: 2 @ 1)
]

{ #category : #tests }
GRoundedRectangleTest >> testIntersectLineSegment [

	| rect |
	rect := GRoundedRectangle
		        rectangle: (GRectangle origin: -40 @ -20 corner: 40 @ 20)
		        borderRadius: 10.
	self
		assert:
		(rect intersectLineSegment: (GLineSegment from: -40 @ 15 to: 40 @ 15))
		equals: {
				(-38.66025403784438 @ 15.0).
				(38.660254037844396 @ 15.0) }.
	self
		assert:
		(rect intersectLineSegment: (GLineSegment from: -40 @ 5 to: 40 @ 5))
		equals: {
				(-40 @ 5).
				(40 @ 5) } asSet
]
