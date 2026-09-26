Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'helpers' }
MyPawn >> captureCandidates [
	| candidates |
	candidates := self isWhite
		ifTrue: [ { 
			square up ifNotNil: [ :s | s left ]. 
			square up ifNotNil: [ :s | s right ] 
		} ]
		ifFalse: [ { 
			square down ifNotNil: [ :s | s left ]. 
			square down ifNotNil: [ :s | s right ] 
		} ].
		
	^ candidates reject: #isNil
]

{ #category : 'helpers' }
MyPawn >> captureMoves [
	^ self captureCandidates select: [ :aSquare | 
		aSquare hasPiece and: [ aSquare contents color ~= color ] ]
]

{ #category : 'helpers' }
MyPawn >> forwardSquare [
	^ self isWhite
		ifTrue: [ square up ]
		ifFalse: [ square down ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'helpers' }
MyPawn >> isUnmoved [
	^ self isWhite
		ifTrue: [ square name second = $2 ]
		ifFalse: [ square name second = $7 ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'helpers' }
MyPawn >> straightMoves [
	| moves nextSquare secondSquare |
	moves := OrderedCollection new.
	nextSquare := self forwardSquare.
	
	(nextSquare notNil and: [ nextSquare hasPiece not ]) ifTrue: [ 
		moves add: nextSquare.
		
		secondSquare := self isWhite 
			ifTrue: [ nextSquare up ] 
			ifFalse: [ nextSquare down ].
			
		(self isUnmoved and: [ secondSquare notNil and: [ secondSquare hasPiece not ] ])
			ifTrue: [ moves add: secondSquare ] ].
			
	^ moves
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	^ self straightMoves , self captureMoves
]
