"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #TOMLWriter, 
	#superclass : #Object, 
	#instVars : [
		#stream, 
		#indent
	], 
	#category : #TOML
}

{#category : #'instance creation'}
TOMLWriter class >> on: aWriteStream [
	^self new on: aWriteStream
]

{#category : #'instance creation'}
TOMLWriter class >> write: aDictionary [
	^String streamContents: [:s |
		(self on: s) write: aDictionary]
]

{#category : #testing}
TOMLWriter >> isArrayOfTables: anObject [
	(anObject isKindOf: Array) ifFalse: [
		(anObject isKindOf: OrderedCollection) ifFalse: [^false]].
	anObject isEmpty ifTrue: [^false].
	^anObject first isKindOf: OrderedDictionary
]

{#category : #testing}
TOMLWriter >> isBareKey: aString [
	aString isEmpty ifTrue: [^false].
	^aString allSatisfy: [:ch |
		ch isAlphanumeric or: [ch = $- or: [ch = $_]]]
]

{#category : #testing}
TOMLWriter >> isTable: anObject [
	^(anObject isKindOf: OrderedDictionary)
		or: [self isArrayOfTables: anObject]
]

{#category : #initialization}
TOMLWriter >> on: aWriteStream [
	stream := aWriteStream.
	indent := ''
]

{#category : #writing}
TOMLWriter >> writeArray: anArray [
	stream nextPut: $[.
	anArray withIndexDo: [:elem :i |
		i > 1 ifTrue: [stream nextPutAll: ', '].
		self writeValue: elem].
	stream nextPut: $]
]

{#category : #writing}
TOMLWriter >> writeArrayOfTables: anArray path: aPath [
	anArray do: [:table |
		stream nextPutAll: '[['.
		self writePath: aPath.
		stream nextPutAll: ']]'.
		stream nextPut: Character lf.
		self writeTopLevel: table path: aPath]
]

{#category : #writing}
TOMLWriter >> write: aDictionary [
	self writeTopLevel: aDictionary path: #()
]

{#category : #writing}
TOMLWriter >> writeBasicString: aString [
	stream nextPut: $".
	aString do: [:ch |
		ch = $" ifTrue: [stream nextPut: $\].
		ch = $\ ifTrue: [stream nextPut: $\].
		ch = Character lf ifTrue: [stream nextPutAll: '\n'. ^self].
		ch = Character cr ifTrue: [stream nextPutAll: '\r'. ^self].
		ch = Character tab ifTrue: [stream nextPutAll: '\t'. ^self].
		stream nextPut: ch].
	stream nextPut: $"
]

{#category : #writing}
TOMLWriter >> writeFloat: aFloat [
	aFloat isInfinite
		ifTrue: [
			aFloat > 0
				ifTrue: [stream nextPutAll: 'inf']
				ifFalse: [stream nextPutAll: '-inf']]
		ifFalse: [
			aFloat isNaN
				ifTrue: [stream nextPutAll: 'nan']
				ifFalse: [stream nextPutAll: aFloat printString]]
]

{#category : #writing}
TOMLWriter >> writeInlineTable: aDictionary [
	| first |
	stream nextPutAll: '{'.
	first := true.
	aDictionary keysAndValuesDo: [:k :v |
		first ifTrue: [first := false] ifFalse: [stream nextPutAll: ', '].
		self writeKeyName: k.
		stream nextPutAll: ' = '.
		self writeValue: v].
	stream nextPutAll: '}'
]

{#category : #writing}
TOMLWriter >> writeKey: aString value: anObject [
	self writeKeyName: aString.
	stream nextPutAll: ' = '.
	self writeValue: anObject.
	stream nextPut: Character lf
]

{#category : #writing}
TOMLWriter >> writeKeyName: aString [
	(self isBareKey: aString)
		ifTrue: [stream nextPutAll: aString]
		ifFalse: [self writeBasicString: aString]
]

{#category : #writing}
TOMLWriter >> writePath: anArray [
	anArray withIndexDo: [:key :i |
		i > 1 ifTrue: [stream nextPut: $.].
		self writeKeyName: key]
]

{#category : #writing}
TOMLWriter >> writeTableHeader: anArray [
	stream nextPut: $[.
	self writePath: anArray.
	stream nextPut: $].
	stream nextPut: Character lf
]

{#category : #writing}
TOMLWriter >> writeTopLevel: aDictionary path: anArray [
	| tables |
	tables := OrderedCollection new.
	aDictionary keysAndValuesDo: [:k :v |
		(self isTable: v)
			ifTrue: [tables add: k -> v]
			ifFalse: [self writeKey: k value: v]].
	tables do: [:assoc |
		| key value path |
		key := assoc key.
		value := assoc value.
		path := anArray copyWith: key.
		(self isArrayOfTables: value)
			ifTrue: [self writeArrayOfTables: value path: path]
			ifFalse: [self writeTableHeader: path.
				self writeTopLevel: value path: path]]
]

{#category : #writing}
TOMLWriter >> writeValue: anObject [
	anObject isString ifTrue: [^self writeBasicString: anObject].
	anObject = true ifTrue: [^stream nextPutAll: 'true'].
	anObject = false ifTrue: [^stream nextPutAll: 'false'].
	anObject isInteger ifTrue: [^stream nextPutAll: anObject printString].
	anObject isFloat ifTrue: [^self writeFloat: anObject].
	(anObject isKindOf: Array) ifTrue: [^self writeArray: anObject].
	(anObject isKindOf: OrderedCollection)
		ifTrue: [^self writeArray: anObject asArray].
	(anObject isKindOf: OrderedDictionary) ifTrue: [^self writeInlineTable: anObject].
	stream nextPutAll: anObject printString
]

