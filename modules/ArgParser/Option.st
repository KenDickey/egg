"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #Option, 
	#superclass : #Object, 
	#instVars : [
		#short, 
		#long, 
		#description, 
		#required, 
		#hasValue, 
		#defaultValue
	], 
	#category : #ArgParser
}

{#category : #configuration}
Option >> beFlag [
	hasValue := false.
	defaultValue := false
]

{#category : #configuration}
Option >> beRequired [
	required := true
]

{#category : #accessing}
Option >> defaultValue [
	^defaultValue
]

{#category : #accessing}
Option >> defaultValue: anObject [
	defaultValue := anObject
]

{#category : #accessing}
Option >> description [
	^description
]

{#category : #accessing}
Option >> description: aString [
	description := aString
]

{#category : #testing}
Option >> hasValue [
	^hasValue
]

{#category : #initialization}
Option >> initialize [
	required := false.
	hasValue := true.
	defaultValue := nil
]

{#category : #accessing}
Option >> long [
	^long
]

{#category : #accessing}
Option >> long: aString [
	long := aString
]

{#category : #testing}
Option >> matches: aString [
	^aString = short or: [aString = long]
]

{#category : #accessing}
Option >> name [
	long ifNotNil: [^long copyFrom: 3].
	^short copyFrom: 2
]

{#category : #testing}
Option >> required [
	^required
]

{#category : #accessing}
Option >> short [
	^short
]

{#category : #accessing}
Option >> short: aString [
	short := aString
]

