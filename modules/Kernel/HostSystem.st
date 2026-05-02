"
    Copyright (c) 2024, Javier Pimas.
    See (MIT) license in root directory.
"

Class {
	#name : #HostSystem,
	#superclass : #Object,
	#instVars : [
		'searchPaths'
	],
	#category : #Kernel
}

{ #category : #'search paths' }
HostSystem >> addSearchPath: aString type: aSymbol [
	"Append a search path. aSymbol is #ems or #tonel."
	self searchPaths add: aString -> aSymbol
]

{ #category : #services }
HostSystem >> createDirectory: aString [
	<primitive: HostCreateDirectory>
]

{ #category : #services }
HostSystem >> currentDirectory [
	<primitive: HostCurrentDirectory>
]

HostSystem >> currentMilliseconds [
	<primitive: HostCurrentMilliseconds>
]

HostSystem >> exit: anInteger [
	<primitive: HostExit>
]

{ #category : #bootstrapping }
HostSystem >> fixOverrides [
	<primitive: HostFixOverrides>
]

{ #category : #services }
HostSystem >> getEnv: aString [
	<primitive: HostGetEnv>
]

{ #category : #'search paths' }
HostSystem >> homeDirectory [
	^self isWindows
		ifTrue: [self getEnv: 'USERPROFILE']
		ifFalse: [self getEnv: 'HOME']
]

{ #category : #bootstrapping }
HostSystem >> initializeFFI: anExternalLibrary symbolFinder: anFFIMethod [
	<primitive: HostInitializeFFI>
]

{ #category : #'search paths' }
HostSystem >> isWindows [
	^(self platformName indexOfSubcollection: 'win32') > 0
]

{ #category : #loading }
HostSystem >> load: aSymbol [
	"Search configured paths for a module named aSymbol. Each search path is
	an association `path -> type` where type is #ems (binary segment file) or
	#tonel (sources directory)."
	| relative |
	relative := self pathFor: aSymbol.
	searchPaths ifNil: [^nil].
	searchPaths do: [:assoc | | base type candidate |
		base := assoc key.
		type := assoc value.
		candidate := type = #ems
			ifTrue: [base , '/' , relative , '.ems']
			ifFalse: [base , '/' , relative].
		(self pathExists: candidate) ifTrue: [
			^self loadModuleFromPath: candidate]].
	^nil
]

{ #category : #loading }
HostSystem >> loadModuleFromPath: aString [
	| module |
	module := self primitiveLoadModuleFromPath: aString.
	^module justLoaded
]

{ #category : #logging }
HostSystem >> log: aString level: anInteger [
	<primitive: HostLog>
]

{ #category : #logging }
HostSystem >> logDebug: aString [
	self log: aString level: 1
]

{ #category : #logging }
HostSystem >> logError: aString [
	self log: aString level: 4
]

{ #category : #logging }
HostSystem >> logFatal: aString [
	self log: aString level: 5
]

{ #category : #logging }
HostSystem >> logInfo: aString [
	self log: aString level: 2
]

{ #category : #logging }
HostSystem >> logTrace: aString [
	self log: aString level: 0
]

{ #category : #logging }
HostSystem >> logWarning: aString [
	self log: aString level: 3
]

{ #category : #services }
HostSystem >> pathExists: aString [
	<primitive: HostPathExists>
]

{ #category : #loading }
HostSystem >> pathFor: aSymbol [
	^aSymbol asString replaceAll: '.' with: '/'
]

{ #category : #'search paths' }
HostSystem >> pathSeparator [
	"Separator used by the host OS in PATH-like environment variables."
	^self isWindows ifTrue: [$;] ifFalse: [$:]
]

{ #category : #loading }
HostSystem >> platformName [
	<primitive: HostPlatformName>
]

{ #category : #'search paths' }
HostSystem >> prependSearchPath: aString type: aSymbol [
	self searchPaths addFirst: aString -> aSymbol
]

{ #category : #loading }
HostSystem >> primitiveLoad: aSymbol [
	<primitive: HostLoadModule>
]

{ #category : #loading }
HostSystem >> primitiveLoadModuleFromPath: aString [
	<primitive: HostLoadModuleFromPath>
]

{ #category : #services }
HostSystem >> readFile: filename [
	<primitive: HostReadFile>
]

{ #category : #'search paths' }
HostSystem >> searchPaths [
	"Ordered collection of associations `path -> type` (#ems or #tonel)."
	^searchPaths ifNil: [searchPaths := OrderedCollection new]
]

{ #category : #'search paths' }
HostSystem >> setupDefaultSearchPaths [
	"Configure default search paths. EGG_MODULES_PATH (paths separated by the
	platform-native PATH separator) supplies extra source directories. We also
	walk a few levels up from the current directory so the runtime works both
	from the project root and from a build subdirectory."
	| env home cwd prefixes |
	env := self getEnv: 'EGG_MODULES_PATH'.
	env ifNotNil: [
		(env substringsSplitBy: self pathSeparator) do: [:p |
			self addSearchPath: p type: #tonel.
			self addSearchPath: p type: #ems]].
	cwd := self currentDirectory.
	prefixes := #('' '../' '../../' '../../../' '../../../../').
	prefixes do: [:p | | base |
		base := cwd , '/' , p , 'modules'.
		(self pathExists: base) ifTrue: [
			self addSearchPath: base type: #tonel.
			self addSearchPath: base type: #ems]].
	home := self homeDirectory.
	home ifNotNil: [
		self addSearchPath: home , '/.egg/cache/modules' type: #ems].
	self isWindows ifFalse: [
		self addSearchPath: '/usr/local/share/egg/modules' type: #tonel.
		self addSearchPath: '/usr/local/share/egg/modules' type: #ems]
]

{ #category : #private }
HostSystem >> suspended: aProcess because: anException [
	<primitive: HostSuspendedBecause>
]

{ #category : #services }
HostSystem >> writeFile: aFilename contents: aString [
	<primitive: HostWriteFile>
]
