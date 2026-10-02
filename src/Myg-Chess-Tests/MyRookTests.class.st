Class {
	#name : 'MyRookTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyRookTests >> testId [

	self assert: MyRook new id equals: 'R'
]

{ #category : 'tests' }
MyRookTests >> testMoves [
     "Test connexion Git"
	| rook squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (rook := MyRook white).

	squares := rook targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e5 e6 e7 e8 d4 c4 b4 a4 f4 g4 h4 e3 e2 e1 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyRookTests >> testMovesWithOponentObstacle [

	| bishop squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (bishop := MyRook white).

	"Rooks don't jump above pieces"
	"But they eat pieces of the other color"
	"Let's put a black obstacle on g4, blocking the f rank"
	board at: 'g4' put: MyRook black.

	squares := bishop targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e5 e6 e7 e8 d4 c4 b4 a4 f4 g4 e3 e2 e1 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyRookTests >> testMovesWithSameColorObstacle [

	| bishop squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (bishop := MyRook white).

	"Rooks don't jump above pieces"
	"And they don't eat pieces of the same color either"
	"Let's put a white obstacle on g4, blocking the f rank"
	board at: 'g4' put: MyRook black.

	squares := bishop targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e5 e6 e7 e8 d4 c4 b4 a4 f4 e3 e2 e1 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyRookTests >> testPinnedRookCannotMove [
	| king rook enemyRook board |
	board := MyChessBoard empty.

	"Le Roi blanc est en e1, la Tour blanche en e2, la Tour noire en e8"
	board at: 'e1' put: (king := MyKing white).
	board at: 'e2' put: (rook := MyRook white).
	board at: 'e8' put: (enemyRook := MyRook black).

	"La Tour blanche clouée ne doit pas pouvoir aller sur les côtés (ex: d2)"
	self deny: (rook legalTargetSquares includes: (board at: 'd2'))
]
