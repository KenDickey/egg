"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #Config, 
	#superclass : #Object, 
	#instVars : [
		#project, 
		#user, 
		#merged
	], 
	#category : #EPM
}

{#category : #'instance creation'}
Config class >> load [
			^self new load
]

{#category : #accessing}
Config >> at: aString [
			^merged at: aString ifAbsent: [nil]
]

{#category : #accessing}
Config >> at: aString ifAbsent: aBlock [
			^merged at: aString ifAbsent: aBlock
]

{#category : #accessing}
Config >> dependencies [
			^self at: 'dependencies' ifAbsent: [OrderedDictionary new]
]

{#category : #loading}
Config >> load [
			self loadUser.
	self loadProject.
	self merge
]

{#category : #loading}
Config >> loadProject [
	| cwd path contents |
	cwd := Kernel currentDirectory.
	path := cwd, '/epm.toml'.
	(Kernel pathExists: path)
		ifTrue: [
			contents := Kernel readFile: path.
			project := TOMLParser parse: contents]
		ifFalse: [project := OrderedDictionary new]
]

{#category : #loading}
Config >> loadUser [
	| home path contents |
	home := Kernel getEnv: 'HOME'.
	home ifNil: [user := OrderedDictionary new. ^self].
	path := home, '/.egg/config.toml'.
	(Kernel pathExists: path)
		ifTrue: [
			contents := Kernel readFile: path.
			user := TOMLParser parse: contents]
		ifFalse: [user := OrderedDictionary new]
]

{#category : #private}
Config >> merge [
			merged := OrderedDictionary new.
	self mergeFrom: user into: merged.
	self mergeFrom: project into: merged
]

{#category : #private}
Config >> mergeFrom: aSource into: aTarget [
			aSource keysAndValuesDo: [:k :v |
		| existing |
		existing := aTarget at: k ifAbsent: [nil].
		(v isKindOf: OrderedDictionary)
			ifTrue: [
				(existing isKindOf: OrderedDictionary)
					ifTrue: [self mergeFrom: v into: existing]
					ifFalse: [
						| copy |
						copy := OrderedDictionary new.
						self mergeFrom: v into: copy.
						aTarget at: k put: copy]]
			ifFalse: [aTarget at: k put: v]]
]

{#category : #accessing}
Config >> modulePaths [
	| paths section |
	paths := self at: 'paths'.
	paths ifNil: [^#()].
	section := paths at: 'modules' ifAbsent: [nil].
	section ifNil: [^#()].
	^section
]

{#category : #accessing}
Config >> name [
	| section |
	section := self at: 'project'.
	section ifNil: [^nil].
	^section at: 'name' ifAbsent: [nil]
]

{#category : #accessing}
Config >> project [
			^project
]

{#category : #accessing}
Config >> user [
			^user
]

{#category : #accessing}
Config >> version [
	| section |
	section := self at: 'project'.
	section ifNil: [^nil].
	^section at: 'version' ifAbsent: [nil]
]

