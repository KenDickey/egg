"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #EPMModule, 
	#superclass : #Module, 
	#instVars : [
		#args, 
		#parser
	],
	#category : #EPM
}

{#category : #private}
EPMModule >> addCommand: aString description: aDescription action: aSymbol [
	| command |
	command := Command new
		name: aString;
		description: aDescription.
	command action: [:result | self perform: aSymbol with: result].
	parser addCommand: command.
	^command
]

{#category : #commands}
EPMModule >> commandTest: aResult [
	| name module positionals |
	positionals := aResult positionals.
	positionals isEmpty ifTrue: [
		^self error: 'Usage: epm test <module-name>'].
	name := positionals first.
	module := Kernel load: (name, '.Tests') asSymbol.
	(aResult hasOption: 'debug')
		ifTrue: [self debugTestModule: module]
		ifFalse: [module main: args]
]

{#category : #commands}
EPMModule >> debugTestModule: aModule [
	| suite tests testClasses |
	testClasses := aModule classes select: [:cls | cls inheritsFrom: TestCase].
	suite := TestSuite named: aModule name, ' debug'.
	testClasses do: [:cls | suite addTest: cls buildTestSuite].
	tests := suite allCases.
	Kernel log: 'Running ', aModule name, ' tests in debug mode...'.
	Kernel log: String cr.
	Kernel log: 'suite built with ', tests size printString, ' tests'.
	Kernel log: String cr.
	suite runDebug.
	Kernel log: 'Done: ', tests size printString, ' passed, 0 failed.'.
	Kernel log: String cr
]

{#category : #spec}
EPMModule >> imports [
	^{
		#Kernel -> #(Error OrderedDictionary).
		#ArgParser -> #(ArgParser Command Option).
		#SUnit -> #(TestCase TestSuite).
	}
]

{#category : #main}
EPMModule >> main: aCollection [
	| params |
	args := aCollection.
	self setupParser.
	params := OrderedCollection new.
	3 to: args size do: [:i |
		| arg |
		arg := args at: i.
		params add: arg].
	parser parse: params asArray
]

{#category : #private}
EPMModule >> setupParser [
	parser := ArgParser new name: 'epm'; description: 'Egg Package Manager'.
	((self addCommand: 'test' description: 'Run tests for a module' action: #commandTest:)
		addPositional: 'module';
		addOption: (Option new
			long: '--debug';
			description: 'Run tests without swallowing exceptions';
			beFlag;
			yourself))
]
