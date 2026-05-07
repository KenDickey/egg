"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #RandomModule,
	#superclass : #Module,
	#instVars : [],
	#category : #Random
}

{ #category : #spec }
RandomModule >> imports [
	^{
		#Kernel -> #(Float).
	}
]

{ #category : #spec }
RandomModule >> exports [
	^#(Random)
]
