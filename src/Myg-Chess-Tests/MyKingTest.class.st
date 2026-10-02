Class {
	#name : 'MyKingTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKingTest >> testIsCheckByOpponentsRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e1' put: MyRook black.

	self assert: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsNotCheckBySameColorRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an same color rook on e column"
	board at: 'e1' put: MyRook white.

	self deny: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testKingCannotTakeDefendedPiece [
	| king board enemyRook defendingRook |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Tour noire en e5, défendue par une autre tour noire en a5"
	board at: 'e5' put: (enemyRook := MyRook black).
	board at: 'a5' put: (defendingRook := MyRook black).

	"Le Roi ne doit PAS pouvoir capturer en e5"
	self deny: ((king targetSquaresLegal: true) includes: (board at: 'e5'))
]
