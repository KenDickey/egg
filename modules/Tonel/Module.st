"
	Copyright (c) 2026, Javier Pimás.
	See (MIT) license in root directory.
"

Extension { #name : #Module }

{#category : #'*Tonel'}
Module >> writeSourceTo: aDirectoryPath [
	| writer |
	self classes do: [:cls |
		| filename contents |
		contents := TonelWriter writeClass: cls category: self name.
		filename := aDirectoryPath, '/', cls name, '.st'.
		Kernel writeFile: filename contents: contents].
	self writeExtensionsTo: aDirectoryPath.
	self writeModuleClassTo: aDirectoryPath
]

{#category : #'*Tonel'}
Module >> writeExtensionsTo: aDirectoryPath [
	extensions keysAndValuesDo: [:key :methods |
		| filename contents |
		contents := TonelWriter writeMethods: methods.
		filename := aDirectoryPath, '/', (key copyReplacing: ' ' with: '.'), '.st'.
		Kernel writeFile: filename contents: contents]
]

{#category : #'*Tonel'}
Module >> writeModuleClassTo: aDirectoryPath [
	| cls filename contents |
	cls := self class.
	contents := TonelWriter writeClass: cls category: self name.
	filename := aDirectoryPath, '/', cls name, '.st'.
	Kernel writeFile: filename contents: contents
]
