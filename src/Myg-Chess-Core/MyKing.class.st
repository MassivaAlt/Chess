Class {
	#name : 'MyKing',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyKing >> attackingSquares [

	^ self basicTargetSquares
]

{ #category : 'rendering' }
MyKing >> basicTargetSquares [

	"The king can move one square on each direction including diagonals"
	^ {
		square ifNotNil: #right.
		square up ifNotNil: #right.
		square ifNotNil: #up.
		square up ifNotNil: #left.
		square ifNotNil: #left.
		square left ifNotNil: #down.
		square ifNotNil: #down.
		square down ifNotNil: #right
	}
]

{ #category : 'accessing' }
MyKing >> id [
	
	^ 'K'
]

{ #category : 'testing' }
MyKing >> isCheckMated [
	"We check if the opponent pieces target all my potential movements and myself"

	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :e |
		                     e attackingSquares ].

	^ self legalTargetSquares isEmpty and: [
		  threatenedSquares includes: self square ]
]

{ #category : 'testing' }
MyKing >> isInCheck [
	^ self opponentPieces anySatisfy: [ :p |
		p targetSquares includes: self square ]
]

{ #category : 'testing' }
MyKing >> isKing [
	^ true
]

{ #category : 'rendering' }
MyKing >> legalTargetSquares [
	^ self targetSquaresLegal: true
]

{ #category : 'accessing' }
MyKing >> opponentPieces [

	^ self board pieces select: [ :e |
		  e notNil and: [ e color = color negated ] ]
]

{ #category : 'rendering' }
MyKing >> renderOn: aSquare [
	^ self isWhite
		ifFalse: [
			aSquare color isBlack
				ifFalse: [ 'L' ]
				ifTrue: [ 'l' ] ]
		ifTrue: [
			aSquare color isBlack
				ifFalse: [ 'K' ]
				ifTrue: [ 'k' ] ]
]

{ #category : 'rendering' }
MyKing >> renderPieceOn: aSquare [

	^ aSquare renderKing: self
]

{ #category : 'rendering' }
MyKing >> targetSquares [
	^ self basicTargetSquares
]

{ #category : 'rendering' }
MyKing >> targetSquaresLegal: aBoolean [
	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :e | e targetSquares ].

	^ self targetSquares select: [ :s |
		(threatenedSquares includes: s) not ]
]
