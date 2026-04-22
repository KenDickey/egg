"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #ParseResult, 
	#superclass : #Object, 
	#instVars : [
		#command, 
		#positionals, 
		#options
	], 
	#category : #ArgParser
}

{#category : #accessing}
ParseResult >> addPositional: aString [
	positionals add: aString
]

{#category : #accessing}
ParseResult >> command [
	^command
]

{#category : #accessing}
ParseResult >> command: aString [
	command := aString
]

{#category : #testing}
ParseResult >> hasOption: aString [
	^options includesKey: aString
]

{#category : #initialization}
ParseResult >> initialize [
	positionals := OrderedCollection new.
	options := OrderedDictionary new
]

{#category : #accessing}
ParseResult >> optionAt: aString [
	^options at: aString ifAbsent: [nil]
]

{#category : #accessing}
ParseResult >> optionAt: aString ifAbsent: aBlock [
	^options at: aString ifAbsent: aBlock
]

{#category : #accessing}
ParseResult >> options [
	^options
]

{#category : #accessing}
ParseResult >> positionalAt: anInteger [
	^positionals at: anInteger
]

{#category : #accessing}
ParseResult >> positionals [
	^positionals
]

{#category : #accessing}
ParseResult >> setOption: aString to: aValue [
	options at: aString put: aValue
]

