"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #EPMModule, 
	#superclass : #Module, 
	#instVars : [
		#args, 
		#parser, 
		#config
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
EPMModule >> commandDev: aResult [
	| cwd name dev module |
	cwd := Kernel currentDirectory.
	name := cwd copyAfterLast: $/.
	dev := Kernel load: #Development.
	module := Kernel load: name asSymbol.
	dev main: args
]

{#category : #commands}
EPMModule >> commandInit: aResult [
	| cwd name generator |
	cwd := Kernel currentDirectory.
	name := cwd copyAfterLast: $/.
	name isEmpty ifTrue: [name := 'myproject'].
	generator := ProjectGenerator new.
	generator name: name.
	generator dir: cwd.
	generator generateToml.
	Kernel log: 'Initialized epm.toml for: ', name
]

{#category : #commands}
EPMModule >> commandInstall: aResult [
	| dependencies |
	config ifNil: [self loadConfig].
	dependencies := config dependencies.
	dependencies isEmpty ifTrue: [
		Kernel log: 'No dependencies to install'.
		^self].
	Kernel log: 'Installing dependencies...'.
	dependencies keysAndValuesDo: [:name :constraint |
		Kernel log: '  ', name, ' (', constraint asString, ')'].
	Kernel log: 'Done'
]

{#category : #commands}
EPMModule >> commandList: aResult [
	| dependencies |
	config ifNil: [self loadConfig].
	dependencies := config dependencies.
	dependencies isEmpty ifTrue: [
		Kernel log: 'No dependencies'.
		^self].
	Kernel log: config name ifNil: ['(unnamed project)'].
	dependencies keysAndValuesDo: [:name :constraint |
		Kernel log: '  ', name, ' ', constraint asString]
]

{#category : #commands}
EPMModule >> commandNew: aResult [
	| name generator |
	aResult positionals isEmpty ifTrue: [
		^self error: 'Usage: epm new <project-name>'].
	name := aResult positionalAt: 1.
	generator := ProjectGenerator new.
	generator name: name.
	generator generate.
	Kernel log: 'Created project: ', name
]

{#category : #commands}
EPMModule >> commandStart: aResult [
	| cwd name module |
	cwd := Kernel currentDirectory.
	name := cwd copyAfterLast: $/.
	module := Kernel load: name asSymbol.
	module main: args
]

{#category : #commands}
EPMModule >> commandTest: aResult [
	| name module positionals |
	positionals := aResult positionals.
	name := positionals isEmpty
		ifTrue: [self projectName]
		ifFalse: [positionals first].
	name ifNil: [
		^self error: 'Usage: epm test [module-name]'].
	module := Kernel load: (name, '.Tests') asSymbol.
	(aResult optionAt: 'debug') == true
		ifTrue: [self debugTestModule: module]
		ifFalse: [module main: args]
]

{#category : #commands}
EPMModule >> debugTestModule: aModule [
	Kernel log: 'Running ', aModule name, ' tests in debug mode...'; log: String cr.
	(TestSuite forModule: aModule) runDebug.
	Kernel log: 'Done.'; log: String cr
]

{#category : #spec}
EPMModule >> imports [
	^{
		#Kernel -> #(Error OrderedDictionary).
		#ArgParser -> #(ArgParser Command Option).
		#SUnit -> #(TestSuite).
		#TOML -> #(TOMLParser TOMLWriter).
	}
]

{#category : #private}
EPMModule >> loadConfig [
	| host |
	config := Config load.
	host := Kernel host.
	config modulePaths do: [:path |
		host prependSearchPath: path type: #tonel.
		host prependSearchPath: path type: #ems]
]

{#category : #main}
EPMModule >> main: aCollection [
	| params |
	args := aCollection.
	self loadConfig.
	self setupParser.
	params := OrderedCollection new.
	3 to: args size do: [:i |
		| arg |
		arg := args at: i.
		params add: arg].
	parser parse: params asArray
]

{#category : #accessing}
EPMModule >> projectName [
	^config ifNotNil: [config name]
]

{#category : #private}
EPMModule >> setupParser [
	| create |
	parser := ArgParser new name: 'epm'; description: 'Egg Package Manager'.
	create := self addCommand: 'new' description: 'Create a new project' action: #commandNew:.
	create addPositional: 'name'.
	self addCommand: 'init' description: 'Initialize epm.toml in current directory' action: #commandInit:.
	self addCommand: 'start' description: 'Run current project' action: #commandStart:.
	self addCommand: 'dev' description: 'Start development environment for current project' action: #commandDev:.
	self addCommand: 'install' description: 'Install dependencies from epm.toml' action: #commandInstall:.
	self addCommand: 'list' description: 'List project dependencies' action: #commandList:.
	((self addCommand: 'test' description: 'Run tests for a module' action: #commandTest:)
		addPositional: 'module';
		addOption: (Option new
			long: '--debug';
			description: 'Run tests without swallowing exceptions';
			beFlag;
			yourself))
]

