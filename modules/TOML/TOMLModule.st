"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #TOMLModule, 
	#superclass : #Module, 
	#category : #TOML
}

{#category : #spec}
TOMLModule >> imports [
	^{
		#Kernel -> #(Character Error OrderedDictionary).
	}
]

