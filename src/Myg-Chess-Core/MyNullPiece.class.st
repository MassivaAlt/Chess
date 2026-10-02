Class {
	#name : 'MyNullPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core-Base',
	#package : 'Myg-Chess-Core',
	#tag : 'Base'
}

{ #category : 'testing' }
MyNullPiece >> isEmpty [
	^ true
]

{ #category : 'testing' }
MyNullPiece >> isPiece [
	^ false
]

{ #category : 'rendering' }
MyNullPiece >> targetSquaresLegal: aBoolean [
	^ #()
]
