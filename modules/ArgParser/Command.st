"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #Command, 
	#superclass : #Object, 
	#instVars : [
		#name, 
		#description, 
		#options, 
		#positionalNames, 
		#action, 
		#subcommands
	], 
	#category : #ArgParser
}

{#category : #accessing}
Command >> action [
	^action
]

{#category : #accessing}
Command >> action: aBlock [
	action := aBlock
]

{#category : #configuration}
Command >> addOption: anOption [
	options add: anOption
]

{#category : #configuration}
Command >> addPositional: aString [
	positionalNames add: aString
]

{#category : #configuration}
Command >> addSubcommand: aCommand [
	subcommands at: aCommand name put: aCommand
]

{#category : #private}
Command >> applyDefaults: aResult [
	options do: [:opt |
		(aResult hasOption: opt name) ifFalse: [
			opt defaultValue ifNotNil: [:v |
				aResult setOption: opt name to: v]]]
]

{#category : #private}
Command >> checkRequired: aResult [
			options do: [:opt |
		| name |
		name := opt long ifNil: [opt short].
		(opt required and: [(aResult hasOption: opt name) not])
			ifTrue: [self error: 'Required option missing: ', name]]
]

{#category : #accessing}
Command >> description [
	^description
]

{#category : #accessing}
Command >> description: aString [
	description := aString
]

{#category : #private}
Command >> findOption: aString [
	^options detect: [:opt | opt matches: aString] ifNone: [nil]
]

{#category : #testing}
Command >> hasSubcommands [
	^subcommands notEmpty
]

{#category : #initialization}
Command >> initialize [
	options := OrderedCollection new.
	positionalNames := OrderedCollection new.
	subcommands := OrderedDictionary new
]

{#category : #accessing}
Command >> name [
	^name
]

{#category : #accessing}
Command >> name: aString [
	name := aString
]

{#category : #accessing}
Command >> options [
	^options
]

{#category : #parsing}
Command >> parse: args into: result [
	| i |
	i := 1.
	[i <= args size] whileTrue: [
		| arg |
		arg := args at: i.
		(arg first = $-)
			ifTrue: [i := self parseOption: arg from: args at: i into: result]
			ifFalse: [result addPositional: arg].
		i := i + 1].
	self checkRequired: result.
	self applyDefaults: result
]

{#category : #parsing}
Command >> parseOption: aString from: anArray at: anInteger into: aResult [
	| opt |
	opt := self findOption: aString.
	opt ifNil: [self error: 'Unknown option: ', aString].
	opt hasValue ifTrue: [
		| val next |
		next := anInteger + 1.
		next > anArray size ifTrue: [self error: 'Option ', aString, ' requires a value'].
		val := anArray at: next.
		aResult setOption: opt name to: val.
		^next]
	ifFalse: [
		aResult setOption: opt name to: true].
	^anInteger
]

{#category : #accessing}
Command >> positionalNames [
	^positionalNames
]

{#category : #printing}
Command >> printUsageOn: aStream [
	aStream nextPutAll: name.
	positionalNames do: [:pname |
		aStream nextPutAll: ' <'; nextPutAll: pname; nextPut: $>].
	options do: [:opt |
		aStream nextPutAll: ' ['.
		opt short ifNotNil: [:s | aStream nextPutAll: s].
		(opt short notNil and: [opt long notNil]) ifTrue: [aStream nextPutAll: '|'].
		opt long ifNotNil: [:l | aStream nextPutAll: l].
		opt hasValue ifTrue: [aStream nextPutAll: ' <value>'].
		aStream nextPut: $]]
]

{#category : #accessing}
Command >> subcommands [
	^subcommands
]

