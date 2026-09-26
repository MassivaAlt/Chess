Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testWhitePawnCapturesDiagonal [
	| board pawn enemyTarget squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'f5' put: (enemyTarget := MyPawn black).

	squares := pawn targetSquares.

	self assert: (squares includes: (board at: 'f5')).
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnInitialTwoSquaresMove [
	| board pawn squares |
	board := MyChessBoard empty.
	board at: 'd2' put: (pawn := MyPawn white).

	squares := pawn targetSquares.

	self assert: (squares includes: (board at: 'd4')).
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnMovesOneSquare [
	| board pawn squares |
	board := MyChessBoard empty.
	board at: 'd2' put: (pawn := MyPawn white).

	squares := pawn targetSquares.

	self assert: (squares includes: (board at: 'd3')).
]
