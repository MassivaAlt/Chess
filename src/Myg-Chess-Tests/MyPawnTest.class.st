Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testWhitePawnMovesOneSquare [
	| board pawn squares |
	board := MyChessBoard empty.
	board at: 'd2' put: (pawn := MyPawn white).

	squares := pawn targetSquares.

	self assert: (squares includes: (board at: 'd3')).
]
