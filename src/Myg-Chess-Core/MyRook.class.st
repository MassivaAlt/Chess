Class {
	#name : 'MyRook',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyRook >> id [
	^ 'R'
]

{ #category : 'rendering' }
MyRook >> renderOn: aSquare [
	^ self isWhite
		ifFalse: [
			aSquare color isBlack
				ifFalse: [ 'T' ]
				ifTrue: [ 't' ] ]
		ifTrue: [
			aSquare color isBlack
				ifFalse: [ 'R' ]
				ifTrue: [ 'r' ] ]
]

{ #category : 'rendering' }
MyRook >> renderPieceOn: aSquare [

	^ aSquare renderRook: self
]

{ #category : 'rendering' }
MyRook >> targetSquares [
	^ self upFile , self downFile , self leftFile , self rightFile
]

{ #category : 'rendering' }
MyRook >> targetSquaresLegal: aBoolean [
	| squares |

	squares := (self upFileLegal: aBoolean)
		, (self downFileLegal: aBoolean)
		, (self leftFileLegal: aBoolean)
		, (self rightFileLegal: aBoolean).

	aBoolean ifFalse: [ ^ squares ].

	^ squares select: [ :aSquare |
		self canMoveTo: aSquare
	]
]
