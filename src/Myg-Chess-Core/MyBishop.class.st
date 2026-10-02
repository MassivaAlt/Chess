Class {
	#name : 'MyBishop',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyBishop >> id [
	
	^ 'B'
]

{ #category : 'rendering' }
MyBishop >> renderOn: aSquare [
	^ self isWhite
		ifTrue: [
			aSquare color isBlack
				ifFalse: [ 'B' ]
				ifTrue: [ 'b' ] ]
		ifFalse: [
			aSquare color isBlack
				ifFalse: [ 'V' ]
				ifTrue: [ 'v' ] ]
]

{ #category : 'rendering' }
MyBishop >> renderPieceOn: aSquare [

	^ aSquare renderBishop: self
]

{ #category : 'rendering' }
MyBishop >> targetSquaresLegal: aBoolean [

	^ (self upRightDiagonalLegal: aBoolean)
	  , (self upLeftDiagonalLegal: aBoolean)
	  , (self downRightDiagonalLegal: aBoolean)
	  , (self downLeftDiagonalLegal: aBoolean)
]
