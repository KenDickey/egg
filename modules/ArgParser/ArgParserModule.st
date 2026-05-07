"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #ArgParserModule, 
	#superclass : #Module, 
	#category : #ArgParser
}

{#category : #spec}
ArgParserModule >> imports [
	^{
		#Kernel -> #(Error OrderedDictionary).
	}
]

