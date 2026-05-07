"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #TOMLParser, 
	#superclass : #Object, 
	#instVars : [
		#stream, 
		#root, 
		#current
	], 
	#category : #TOML
}

{#category : #'instance creation'}
TOMLParser class >> on: aReadStream [
	^self new on: aReadStream
]

{#category : #'instance creation'}
TOMLParser class >> parse: aString [
	^(self on: aString readStream) parse
]

{#category : #testing}
TOMLParser >> atTripleQuote: aCharacter [
	| position |
	stream peek = aCharacter ifFalse: [^false].
	position := stream position.
	stream next.
	(stream peekFor: aCharacter) ifTrue: [
		(stream peekFor: aCharacter) ifTrue: [^true]].
	stream position: position.
	^false
]

{#category : #private}
TOMLParser >> error: aString [
	^Error signal: 'TOML parse error at position ',
		stream position asString, ': ', aString
]

{#category : #private}
TOMLParser >> expect: aString [
	aString do: [:each |
		(stream peekFor: each) ifFalse: [
			self error: 'Expected "', aString, '"']]
]

{#category : #private}
TOMLParser >> expectChar: aCharacter [
	| found |
	(stream peekFor: aCharacter) ifTrue: [^self].
	found := stream atEnd
		ifTrue: ['end of input']
		ifFalse: [stream peek asString].
	self error: 'Expected ', aCharacter asString, ' but got ', found
]

{#category : #private}
TOMLParser >> hexValue: aCharacter [
	| code |
	code := aCharacter asInteger.
	(code between: 48 and: 57) ifTrue: [^code - 48].
	(code between: 65 and: 70) ifTrue: [^code - 55].
	(code between: 97 and: 102) ifTrue: [^code - 87].
	self error: 'Invalid hex digit'
]

{#category : #testing}
TOMLParser >> isBareKeyChar: aCharacter [
	^aCharacter isAlphanumeric or: [aCharacter = $- or: [aCharacter = $_]]
]

{#category : #testing}
TOMLParser >> isBinaryChar: aCharacter [
	^aCharacter = $0 or: [aCharacter = $1 or: [aCharacter = $_]]
]

{#category : #testing}
TOMLParser >> isHexChar: aCharacter [
	^aCharacter isDigit or: [
		(aCharacter between: $a and: $f) or: [
	(aCharacter between: $A and: $F) or: [aCharacter = $_]]]
]

{#category : #testing}
TOMLParser >> isNewline: aCharacter [
	^aCharacter = Character cr or: [aCharacter = Character lf]
]

{#category : #testing}
TOMLParser >> isOctalChar: aCharacter [
	^(aCharacter between: $0 and: $7) or: [aCharacter = $_]
]

{#category : #private}
TOMLParser >> matchChar: aCharacter [
	^stream peekFor: aCharacter
]

{#category : #initialization}
TOMLParser >> on: aReadStream [
	stream := aReadStream
]

{#category : #parsing}
TOMLParser >> parse [
	root := OrderedDictionary new.
	current := root.
	[stream atEnd] whileFalse: [self parseLine].
	^root
]

{#category : #parsing}
TOMLParser >> parseArray [
	| elements |
	self expectChar: $[.
	elements := OrderedCollection new.
	self skipWhitespaceAndNewlines.
	(self matchChar: $]) ifTrue: [^elements asArray].
	[
		self skipWhitespaceAndNewlines.
		elements add: self parseValue.
		self skipWhitespaceAndNewlines.
		self matchChar: $,] whileTrue: [
			self skipWhitespaceAndNewlines.
			(stream peek = $]) ifTrue: [
				self expectChar: $].
				^elements asArray]].
	self skipWhitespaceAndNewlines.
	self expectChar: $].
	^elements asArray
]

{#category : #parsing}
TOMLParser >> parseArrayTable [
	| key table array |
	self skipWhitespace.
	key := self parseDottedKey.
	self
		skipWhitespace;
		expectChar: $];
		expectChar: $];
		skipToNewline.
	table := self resolveTable: key allButLast create: true.
	array := table at: key last ifAbsent: [nil].
	array ifNil: [
		array := OrderedCollection new.
		table at: key last put: array].
	current := OrderedDictionary new.
	array add: current
]

{#category : #parsing}
TOMLParser >> parseBareKey [
	| start |
	start := stream position.
	[stream atEnd not and: [self isBareKeyChar: stream peek]]
		whileTrue: [stream next].
	stream position = start ifTrue: [self error: 'Empty bare key'].
	^stream collection copyFrom: start + 1 to: stream position
]

{#category : #parsing}
TOMLParser >> parseBasicString [
	self expectChar: $".
	^self parseBasicStringBody
]

{#category : #parsing}
TOMLParser >> parseBasicStringBody [
	| result |
	result := String streamContents: [:s |
		[stream atEnd or: [stream peek = $"]]
			whileFalse: [s nextPut: self parseCharacter]].
	self expectChar: $".
	^result
]

{#category : #parsing}
TOMLParser >> parseBinaryInteger: aBoolean [
	| value count |
	value := 0.
	count := 0.
	[stream atEnd not and: [self isBinaryChar: stream peek]]
		whileTrue: [
	| digit |
			digit := stream next.
			digit = $_ ifFalse: [
				value := value * 2 + digit digitValue.
				count := count + 1]].
	count = 0 ifTrue: [self error: 'Expected binary digit'].
	aBoolean ifTrue: [^value negated].
	^value
]

{#category : #parsing}
TOMLParser >> parseCharacter [
	| char |
	char := stream next.
	char = $\ ifTrue: [^self parseEscape].
	^char
]

{#category : #parsing}
TOMLParser >> parseDecimalNumber: aBoolean [
	| integer |
	integer := self parseDigits.
	(stream atEnd not and: [stream peek = $.]) ifTrue: [
		stream next.
		^self parseFloat: integer negated: aBoolean].
	(stream atEnd not and: [stream peek = $e or: [stream peek = $E]]) ifTrue: [
		stream next.
		^self parseExponent: integer asFloat negated: aBoolean].
	aBoolean ifTrue: [^integer negated].
	^integer
]

{#category : #parsing}
TOMLParser >> parseDigits [
	| value count |
	value := 0.
	count := 0.
	[stream atEnd not and: [stream peek isDigit or: [stream peek = $_]]]
		whileTrue: [
	| digit |
			digit := stream next.
			digit = $_ ifFalse: [
				value := value * 10 + digit digitValue.
				count := count + 1]].
	count = 0 ifTrue: [self error: 'Expected digit'].
	^value
]

{#category : #parsing}
TOMLParser >> parseDottedKey [
	| parts |
	parts := OrderedCollection new.
	parts add: self parseKey.
	[self skipWhitespace. stream peekFor: $.] whileTrue: [
		self skipWhitespace.
		parts add: self parseKey].
	^parts asArray
]

{#category : #parsing}
TOMLParser >> parseEscape [
	| char |
	char := stream next.
	char = $b ifTrue: [^Character backspace].
	char = $t ifTrue: [^Character tab].
	char = $n ifTrue: [^Character lf].
	char = $f ifTrue: [^Character newPage].
	char = $r ifTrue: [^Character cr].
	char = $" ifTrue: [^$"].
	char = $\ ifTrue: [^$\].
	char = $u ifTrue: [^self parseUnicode: 4].
	char = $U ifTrue: [^self parseUnicode: 8].
	self error: 'Invalid escape: \', char asString
]

{#category : #parsing}
TOMLParser >> parseExponent: aNumber negated: aBoolean [
	| negative exponent result |
	negative := stream peekFor: $-.
	negative ifFalse: [stream peekFor: $+].
	exponent := self parseDigits.
	negative ifTrue: [exponent := exponent negated].
	result := aNumber * (10 raisedTo: exponent).
	aBoolean ifTrue: [^result negated].
	^result
]

{#category : #parsing}
TOMLParser >> parseFalse [
	self expect: 'false'.
	^false
]

{#category : #parsing}
TOMLParser >> parseFloat: anInteger negated: aBoolean [
	| fraction power result |
	fraction := 0.
	power := 1.0.
	[stream atEnd not and: [stream peek isDigit or: [stream peek = $_]]]
		whileTrue: [
	| digit |
			digit := stream next.
			digit = $_ ifFalse: [
				fraction := fraction * 10 + digit digitValue.
				power := power * 10.0]].
	result := anInteger + (fraction / power).
	(stream atEnd not and: [stream peek = $e or: [stream peek = $E]]) ifTrue: [
		stream next.
		^self parseExponent: result negated: aBoolean].
	aBoolean ifTrue: [^result negated].
	^result
]

{#category : #parsing}
TOMLParser >> parseHexDigit [
	| char code |
	stream atEnd ifTrue: [self error: 'Expected hex digit'].
	char := stream next.
	code := char asInteger.
	(code between: 48 and: 57) ifTrue: [^code - 48].
	(code between: 65 and: 70) ifTrue: [^code - 55].
	(code between: 97 and: 102) ifTrue: [^code - 87].
	self error: 'Invalid hex digit: ', char asString
]

{#category : #parsing}
TOMLParser >> parseHexInteger: aBoolean [
	| value count |
	value := 0.
	count := 0.
	[stream atEnd not and: [self isHexChar: stream peek]]
		whileTrue: [ | digit |
			digit := stream next.
			digit = $_ ifFalse: [
				value := (value bitShift: 4) + (self hexValue: digit).
				count := count + 1]].
	count = 0 ifTrue: [self error: 'Expected hex digit'].
	aBoolean ifTrue: [^value negated].
	^value
]

{#category : #parsing}
TOMLParser >> parseInlineTable [
	| table |
	self expectChar: ${.
	table := OrderedDictionary new.
	self skipWhitespace.
	(self matchChar: $}) ifTrue: [^table].
	[
		self skipWhitespace.
		self parseKeyValueInto: table.
		self skipWhitespace.
		self matchChar: $,] whileTrue.
	self skipWhitespace.
	self expectChar: $}.
	^table
]

{#category : #parsing}
TOMLParser >> parseKey [
	| char |
	stream atEnd ifTrue: [self error: 'Expected key'].
	char := stream peek.
	char = $" ifTrue: [^self parseBasicString].
	char = $' ifTrue: [^self parseLiteralString].
	^self parseBareKey
]

{#category : #parsing}
TOMLParser >> parseKeyValue [
	| key value target last |
	key := self parseDottedKey.
	self
		skipWhitespace;
		expectChar: $=;
		skipWhitespace.
	value := self parseValue.
	self skipToNewline.
	target := self resolveIn: current path: key allButLast create: true.
	last := key last.
	(target includesKey: last)
		ifTrue: [self error: 'Duplicate key: ', last].
	target at: last put: value
]

{#category : #parsing}
TOMLParser >> parseKeyValueInto: aDictionary [
	| key value target |
	key := self parseDottedKey.
	self
		skipWhitespace;
		expectChar: $=;
		skipWhitespace.
	value := self parseValue.
	target := self resolveIn: aDictionary path: key allButLast create: true.
	target at: key last put: value
]

{#category : #parsing}
TOMLParser >> parseLine [
	| char |
	self skipWhitespace.
	stream atEnd ifTrue: [^self].
	char := stream peek.
	char = $# ifTrue: [^self skipComment].
	char = $[ ifTrue: [^self parseTableHeader].
	(char = Character cr or: [char = Character lf])
		ifTrue: [^self skipNewline].
	self parseKeyValue
]

{#category : #parsing}
TOMLParser >> parseLiteralString [
	self expectChar: $'.
	^self parseLiteralStringBody
]

{#category : #parsing}
TOMLParser >> parseLiteralStringBody [
	| result |
	result := String streamContents: [:s |
		[stream atEnd or: [stream peek = $']]
			whileFalse: [s nextPut: stream next]].
	self expectChar: $'.
	^result
]

{#category : #parsing}
TOMLParser >> parseLiteralStringValue [
	stream next.
	(stream peekFor: $')
		ifTrue: [
			(stream peekFor: $')
				ifTrue: [^self parseMultilineLiteralString]
				ifFalse: [^'']]
		ifFalse: [^self parseLiteralStringBody]
]

{#category : #parsing}
TOMLParser >> parseMultilineBasicChar: aStream [
	| char |
	char := stream next.
	char = $\ ifFalse: [^aStream nextPut: char].
	(self isNewline: stream peek)
		ifTrue: [self skipWhitespaceAndNewlines]
		ifFalse: [stream back. aStream nextPut: self parseCharacter]
]

{#category : #parsing}
TOMLParser >> parseMultilineBasicString [
	self skipNewlineIfPresent.
	^String streamContents: [:s |
		[stream atEnd or: [self atTripleQuote: $"]]
			whileFalse: [self parseMultilineBasicChar: s]]
]

{#category : #parsing}
TOMLParser >> parseMultilineLiteralString [
	self skipNewlineIfPresent.
	^String streamContents: [:s |
		[stream atEnd or: [self atTripleQuote: $']]
			whileFalse: [s nextPut: stream next]]
]

{#category : #parsing}
TOMLParser >> parseNumberValue [
	| start negated sign |
	negated := false.
	sign := stream peek.
	(sign = $+ or: [sign = $-]) ifTrue: [
		negated := sign = $-.
		stream next].
	start := stream position.
	stream peek = $0 ifTrue: [
		^self parsePrefixedNumber: negated from: start].
	^self parseDecimalNumber: negated
]

{#category : #parsing}
TOMLParser >> parseOctalInteger: aBoolean [
	| value count |
	value := 0.
	count := 0.
	[stream atEnd not and: [self isOctalChar: stream peek]]
		whileTrue: [
	| digit |
			digit := stream next.
			digit = $_ ifFalse: [
				value := value * 8 + digit digitValue.
				count := count + 1]].
	count = 0 ifTrue: [self error: 'Expected octal digit'].
	aBoolean ifTrue: [^value negated].
	^value
]

{#category : #parsing}
TOMLParser >> parsePrefixedNumber: aBoolean from: anInteger [
	| prefix |
	stream next.
	stream atEnd ifTrue: [^0].
	prefix := stream peek.
	prefix = $x ifTrue: [stream next. ^self parseHexInteger: aBoolean].
	prefix = $o ifTrue: [stream next. ^self parseOctalInteger: aBoolean].
	prefix = $b ifTrue: [stream next. ^self parseBinaryInteger: aBoolean].
	(prefix = $. or: [prefix = $e or: [prefix = $E]])
		ifTrue: [stream position: anInteger. ^self parseDecimalNumber: aBoolean].
	^0
]

{#category : #parsing}
TOMLParser >> parseSpecialFloat [
	| position |
	position := stream position.
	(self tryMatch: 'inf') ifTrue: [^Float infinity].
	(self tryMatch: 'nan') ifTrue: [^Float nan].
	stream position: position.
	self error: 'Unexpected character'
]

{#category : #parsing}
TOMLParser >> parseStringValue [
	stream next.
	(stream peekFor: $")
		ifTrue: [
			(stream peekFor: $")
				ifTrue: [^self parseMultilineBasicString]
				ifFalse: [^'']]
		ifFalse: [^self parseBasicStringBody]
]

{#category : #parsing}
TOMLParser >> parseTable [
	| key |
	self skipWhitespace.
	key := self parseDottedKey.
	self
		skipWhitespace;
		expectChar: $];
		skipToNewline.
	current := self resolveTable: key create: true
]

{#category : #parsing}
TOMLParser >> parseTableHeader [
	stream next.
	(stream peekFor: $[)
		ifTrue: [self parseArrayTable]
		ifFalse: [self parseTable]
]

{#category : #parsing}
TOMLParser >> parseTrue [
	self expect: 'true'.
	^true
]

{#category : #parsing}
TOMLParser >> parseUnicode: anInteger [
	| value |
	value := 0.
	anInteger timesRepeat: [
		value := (value bitShift: 4) + self parseHexDigit].
	^Character codePoint: value
]

{#category : #parsing}
TOMLParser >> parseValue [
	| char |
	stream atEnd ifTrue: [self error: 'Expected value'].
	char := stream peek.
	char = $" ifTrue: [^self parseStringValue].
	char = $' ifTrue: [^self parseLiteralStringValue].
	char = $t ifTrue: [^self parseTrue].
	char = $f ifTrue: [^self parseFalse].
	char = $[ ifTrue: [^self parseArray].
	char = ${ ifTrue: [^self parseInlineTable].
	(char = $- or: [char = $+ or: [char isDigit]])
		ifTrue: [^self parseNumberValue].
	char = $i ifTrue: [^self parseSpecialFloat].
	char = $n ifTrue: [^self parseSpecialFloat].
	self error: 'Unexpected character: ', char asString
]

{#category : #private}
TOMLParser >> resolveIn: aDictionary path: anArray create: aBoolean [
	| table |
	table := aDictionary.
	anArray do: [:key |
		| next |
		next := table at: key ifAbsent: [nil].
		next ifNil: [
			aBoolean ifFalse: [^nil].
			next := OrderedDictionary new.
			table at: key put: next].
		(next isKindOf: OrderedCollection)
			ifTrue: [table := next last]
			ifFalse: [table := next]].
	^table
]

{#category : #private}
TOMLParser >> resolveTable: anArray create: aBoolean [
			^self resolveIn: root path: anArray create: aBoolean
]

{#category : #private}
TOMLParser >> skipComment [
	[stream atEnd not and: [(self isNewline: stream peek) not]]
		whileTrue: [stream next]
]

{#category : #private}
TOMLParser >> skipNewline [
	(stream peekFor: Character cr) ifTrue: [stream peekFor: Character lf].
	stream peekFor: Character lf
]

{#category : #private}
TOMLParser >> skipNewlineIfPresent [
	(stream atEnd not and: [self isNewline: stream peek])
		ifTrue: [self skipNewline]
]

{#category : #private}
TOMLParser >> skipToNewline [
	self skipWhitespace.
	stream atEnd ifTrue: [^self].
	stream peek = $# ifTrue: [self skipComment].
	stream atEnd ifTrue: [^self].
	(self isNewline: stream peek)
		ifTrue: [self skipNewline]
		ifFalse: [self error: 'Expected newline, got: ', stream peek asString]
]

{#category : #private}
TOMLParser >> skipWhitespace [
	[stream atEnd not and: [
		| char |
		char := stream peek.
		char = Character space or: [char = Character tab]]]
		whileTrue: [stream next]
]

{#category : #private}
TOMLParser >> skipWhitespaceAndNewlines [
	[stream atEnd not and: [
		| char |
		char := stream peek.
		char = Character space or: [
			char = Character tab or: [
				char = Character cr or: [
					char = Character lf or: [char = $#]]]]]]
		whileTrue: [
			stream peek = $#
				ifTrue: [self skipComment]
				ifFalse: [stream next]]
]

{#category : #private}
TOMLParser >> tryMatch: aString [
	| position |
	position := stream position.
	aString do: [:each |
		(stream peekFor: each) ifFalse: [
			stream position: position.
			^false]].
	^true
]

