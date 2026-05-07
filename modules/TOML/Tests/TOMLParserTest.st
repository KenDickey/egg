"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #TOMLParserTest,
	#superclass : #TestCase,
	#category : #'TOML.Tests'
}

{ #category : #'testing - strings' }
TOMLParserTest >> testBasicString [
	| result |
	result := TOMLParser parse: 'key = "hello"'.
	self assert: (result at: 'key') equals: 'hello'
]

{ #category : #'testing - strings' }
TOMLParserTest >> testStringEscapes [
	| result |
	result := TOMLParser parse: 'key = "hello\nworld"'.
	self assert: (result at: 'key') equals: 'hello', Character lf asString, 'world'
]

{ #category : #'testing - strings' }
TOMLParserTest >> testEmptyString [
	| result |
	result := TOMLParser parse: 'key = ""'.
	self assert: (result at: 'key') equals: ''
]

{ #category : #'testing - strings' }
TOMLParserTest >> testLiteralString [
	| result |
	result := TOMLParser parse: 'key = ''no \escapes'''.
	self assert: (result at: 'key') equals: 'no \escapes'
]

{ #category : #'testing - strings' }
TOMLParserTest >> testMultilineBasicString [
	| input result |
	input := 'key = """
hello
world"""'.
	result := TOMLParser parse: input.
	self assert: (result at: 'key') equals: 'hello', Character lf asString, 'world'
]

{ #category : #'testing - strings' }
TOMLParserTest >> testMultilineLiteralString [
	| input result |
	input := 'key = ''''''
first
second'''''''.
	result := TOMLParser parse: input.
	self assert: (result at: 'key') equals: 'first', Character lf asString, 'second'
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testInteger [
	| result |
	result := TOMLParser parse: 'key = 42'.
	self assert: (result at: 'key') equals: 42
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testNegativeInteger [
	| result |
	result := TOMLParser parse: 'key = -17'.
	self assert: (result at: 'key') equals: -17
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testPositiveInteger [
	| result |
	result := TOMLParser parse: 'key = +99'.
	self assert: (result at: 'key') equals: 99
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testZero [
	| result |
	result := TOMLParser parse: 'key = 0'.
	self assert: (result at: 'key') equals: 0
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testUnderscoresInInteger [
	| result |
	result := TOMLParser parse: 'key = 1_000_000'.
	self assert: (result at: 'key') equals: 1000000
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testHexInteger [
	| result |
	result := TOMLParser parse: 'key = 0xff'.
	self assert: (result at: 'key') equals: 255
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testOctalInteger [
	| result |
	result := TOMLParser parse: 'key = 0o77'.
	self assert: (result at: 'key') equals: 63
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testBinaryInteger [
	| result |
	result := TOMLParser parse: 'key = 0b1010'.
	self assert: (result at: 'key') equals: 10
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testFloat [
	| result |
	result := TOMLParser parse: 'key = 3.14'.
	self assert: ((result at: 'key') - 3.14) abs < 0.001
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testFloatWithExponent [
	| result |
	result := TOMLParser parse: 'key = 1e10'.
	self assert: (result at: 'key') equals: 10000000000.0
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testNegativeFloat [
	| result |
	result := TOMLParser parse: 'key = -0.5'.
	self assert: ((result at: 'key') + 0.5) abs < 0.001
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testInfinity [
	| result |
	result := TOMLParser parse: 'key = inf'.
	self assert: (result at: 'key') equals: Float infinity
]

{ #category : #'testing - numbers' }
TOMLParserTest >> testNan [
	| result |
	result := TOMLParser parse: 'key = nan'.
	self assert: (result at: 'key') isNaN
]

{ #category : #'testing - booleans' }
TOMLParserTest >> testTrue [
	| result |
	result := TOMLParser parse: 'key = true'.
	self assert: (result at: 'key') equals: true
]

{ #category : #'testing - booleans' }
TOMLParserTest >> testFalse [
	| result |
	result := TOMLParser parse: 'key = false'.
	self assert: (result at: 'key') equals: false
]

{ #category : #'testing - arrays' }
TOMLParserTest >> testEmptyArray [
	| result |
	result := TOMLParser parse: 'key = []'.
	self assert: (result at: 'key') equals: #()
]

{ #category : #'testing - arrays' }
TOMLParserTest >> testIntegerArray [
	| result |
	result := TOMLParser parse: 'key = [1, 2, 3]'.
	self assert: (result at: 'key') equals: #(1 2 3)
]

{ #category : #'testing - arrays' }
TOMLParserTest >> testMixedArray [
	| result array |
	result := TOMLParser parse: 'key = [1, "two", true]'.
	array := result at: 'key'.
	self
		assert: array size equals: 3;
		assert: (array at: 1) equals: 1;
		assert: (array at: 2) equals: 'two';
		assert: (array at: 3) equals: true
]

{ #category : #'testing - arrays' }
TOMLParserTest >> testMultilineArray [
	| input result |
	input := 'key = [
  1,
  2,
  3,
]'.
	result := TOMLParser parse: input.
	self assert: (result at: 'key') equals: #(1 2 3)
]

{ #category : #'testing - tables' }
TOMLParserTest >> testSimpleTable [
	| input result |
	input := '[server]
host = "localhost"
port = 8080'.
	result := TOMLParser parse: input.
	self
		assert: ((result at: 'server') at: 'host') equals: 'localhost';
		assert: ((result at: 'server') at: 'port') equals: 8080
]

{ #category : #'testing - tables' }
TOMLParserTest >> testNestedTable [
	| input result |
	input := '[a.b]
key = "value"'.
	result := TOMLParser parse: input.
	self assert: (((result at: 'a') at: 'b') at: 'key') equals: 'value'
]

{ #category : #'testing - tables' }
TOMLParserTest >> testInlineTable [
	| result table |
	result := TOMLParser parse: 'point = {x = 1, y = 2}'.
	table := result at: 'point'.
	self
		assert: (table at: 'x') equals: 1;
		assert: (table at: 'y') equals: 2
]

{ #category : #'testing - tables' }
TOMLParserTest >> testArrayOfTables [
	| input result products |
	input := '[[products]]
name = "Hammer"

[[products]]
name = "Nail"'.
	result := TOMLParser parse: input.
	products := result at: 'products'.
	self
		assert: products size equals: 2;
		assert: (products first at: 'name') equals: 'Hammer';
		assert: (products last at: 'name') equals: 'Nail'
]

{ #category : #'testing - keys' }
TOMLParserTest >> testBareKey [
	| result |
	result := TOMLParser parse: 'bare-key_123 = "value"'.
	self assert: (result at: 'bare-key_123') equals: 'value'
]

{ #category : #'testing - keys' }
TOMLParserTest >> testQuotedKey [
	| result |
	result := TOMLParser parse: '"quoted key" = "value"'.
	self assert: (result at: 'quoted key') equals: 'value'
]

{ #category : #'testing - keys' }
TOMLParserTest >> testDottedKey [
	| result |
	result := TOMLParser parse: 'a.b.c = "deep"'.
	self assert: (((result at: 'a') at: 'b') at: 'c') equals: 'deep'
]

{ #category : #'testing - comments' }
TOMLParserTest >> testComment [
	| input result |
	input := '# this is a comment
key = "value" # inline comment'.
	result := TOMLParser parse: input.
	self assert: (result at: 'key') equals: 'value'
]

{ #category : #'testing - keys' }
TOMLParserTest >> testMultipleKeyValues [
	| input result |
	input := 'name = "test"
version = "1.0"
count = 5'.
	result := TOMLParser parse: input.
	self
		assert: (result at: 'name') equals: 'test';
		assert: (result at: 'version') equals: '1.0';
		assert: (result at: 'count') equals: 5
]

{ #category : #'testing - errors' }
TOMLParserTest >> testDuplicateKeyError [
	self should: [
		TOMLParser parse: 'key = 1
key = 2'] raise: Error
]

{ #category : #'testing - integration' }
TOMLParserTest >> testEpmToml [
	| input result project dependencies |
	input := '[project]
name = "myapp"
version = "0.1.0"
description = "A test app"

[dependencies]
JSON = ">=1.0"
STON = "~>2.0"'.
	result := TOMLParser parse: input.
	project := result at: 'project'.
	dependencies := result at: 'dependencies'.
	self
		assert: (project at: 'name') equals: 'myapp';
		assert: (project at: 'version') equals: '0.1.0';
		assert: (dependencies at: 'JSON') equals: '>=1.0';
		assert: (dependencies at: 'STON') equals: '~>2.0'
]

{ #category : #'testing - integration' }
TOMLParserTest >> testComplexDocument [
	| input result owner database servers |
	input := 'title = "TOML Example"

[owner]
name = "John"

[database]
ports = [8001, 8001, 8002]
enabled = true

[servers.alpha]
ip = "10.0.0.1"

[servers.beta]
ip = "10.0.0.2"'.
	result := TOMLParser parse: input.
	owner := result at: 'owner'.
	database := result at: 'database'.
	servers := result at: 'servers'.
	self
		assert: (result at: 'title') equals: 'TOML Example';
		assert: (owner at: 'name') equals: 'John';
		assert: (database at: 'ports') equals: #(8001 8001 8002);
		assert: (database at: 'enabled') equals: true;
		assert: ((servers at: 'alpha') at: 'ip') equals: '10.0.0.1';
		assert: ((servers at: 'beta') at: 'ip') equals: '10.0.0.2'
]
