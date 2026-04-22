"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #ArgParser, 
	#superclass : #Object, 
	#instVars : [
		#name, 
		#description, 
		#commands, 
		#globalOptions
	], 
	#category : #ArgParser
}

{#category : #commands}
ArgParser >> addCommand: aCommand [
	commands at: aCommand name put: aCommand
]

{#category : #options}
ArgParser >> addGlobalOption: anOption [
	globalOptions add: anOption
]

{#category : #accessing}
ArgParser >> description [
	^description
]

{#category : #accessing}
ArgParser >> description: aString [
	description := aString
]

{#category : #parsing}
ArgParser >> extractGlobalArgs: args [
	| remaining i |
	remaining := OrderedCollection new.
	i := 1.
	[i <= args size] whileTrue: [
		| arg match rest |
		arg := args at: i.
		match := globalOptions detect: [:opt | opt matches: arg] ifNone: [nil].
		match ifNotNil: [
			match hasValue ifTrue: [i := i + 1]
		] ifNil: [
			rest := args copyFrom: i to: args size.
			^remaining addAll: rest; yourself].
		i := i + 1].
	^remaining
]

{#category : #initialization}
ArgParser >> initialize [
	commands := OrderedDictionary new.
	globalOptions := OrderedCollection new
]

{#category : #accessing}
ArgParser >> name [
	^name
]

{#category : #accessing}
ArgParser >> name: aString [
	name := aString
]

{#category : #parsing}
ArgParser >> parse: args [
	| remaining key command result tail |
	remaining := self extractGlobalArgs: args.
	remaining isEmpty ifTrue: [self printHelp. ^nil].
	key := remaining first.
	command := commands at: key ifAbsent: [
		self error: 'Unknown command: ', key, '. Run with no args for help.'].
	result := ParseResult new.
	result command: key.
	tail := remaining copyFrom: 2 to: remaining size.
	command parse: tail into: result.
	command action ifNotNil: [:act | act value: result].
	^result
]

{#category : #printing}
ArgParser >> printHelp [
	| text |
	text := name ifNil: ['command'].
	description ifNotNil: [
		text := text , ' - ' , description].
	text := text , String cr , String cr , 'Commands:' , String cr.
	commands keysAndValuesDo: [:key :cmd |
		text := text , '  ' , key.
		cmd description ifNotNil: [:d |
			text := text , '  - ' , d].
		text := text , String cr].
	Kernel log: text
]

