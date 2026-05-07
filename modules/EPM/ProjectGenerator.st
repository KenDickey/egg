"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #ProjectGenerator, 
	#superclass : #Object, 
	#instVars : [
		#name, 
		#dir
	], 
	#category : #EPM
}

{#category : #accessing}
ProjectGenerator >> dir: aString [
	dir := aString
]

{#category : #private}
ProjectGenerator >> ensureDir [
	dir ifNil: [
		dir := Kernel currentDirectory, '/', name].
	Kernel createDirectory: dir
]

{#category : #generating}
ProjectGenerator >> generate [
	| modules module |
	self ensureDir.
	modules := dir, '/modules'.
	module := modules, '/', self moduleName.
	Kernel createDirectory: modules.
	Kernel createDirectory: module.
	self generateToml.
	self generateModule: module
]

{#category : #generating}
ProjectGenerator >> generateModule: aString [
	| filename contents module |
	module := self moduleName.
	filename := aString, '/', module, 'Module.st'.
	contents := '"
    See (MIT) license in root directory.
"

Class {
	#name : #', module, 'Module,
	#superclass : #Module,
	#instVars : [],
	#category : #', module, '
}

{ #category : #main }
', module, 'Module >> main: args [
	Kernel log: ''Hello from ', name, '''
]
'.
	Kernel writeFile: filename contents: contents
]

{#category : #generating}
ProjectGenerator >> generateToml [
	| filename contents |
	self ensureDir.
	filename := dir, '/epm.toml'.
	contents := '[project]
name = "', name, '"
version = "0.1.0"
description = ""

[dependencies]
'.
	Kernel writeFile: filename contents: contents
]

{#category : #accessing}
ProjectGenerator >> moduleName [
	| first |
	first := name first asUppercase.
	^(String with: first), (name copyFrom: 2)
]

{#category : #accessing}
ProjectGenerator >> name: aString [
	name := aString
]

