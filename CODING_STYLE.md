# Coding Style

This document describes the coding style rules for egg. All code is expected to
strictly follow them to maintain the homogeneity of the codebase.

## General Philosophy

We spend most of our time reading existing code. For that reason we aim to minimize
the amount of text to be read. Shorter code means less effort and more things fitting
on screen.

- Favor simplicity and minimality over performance.
- Leave simple optimizations to the runtime system instead of writing them by hand.
- All code is autoformatted, unless there is a _very_ special and specific reason.
- Prefer words that are already part of the existing vocabulary in the code corpus.

## Naming

### Temporary Variables

Temporary names consist of just **one word**, chosen by priority:
1. Usage — what it is used for.
2. Contents — what it holds.
3. Type — what kind of object it is.

```smalltalk
"Good — named by usage"
done := Set new.

"Acceptable — named by contents"
tasks := Set new.

"Avoid — named by type"
set := Set new.
```

Do not reuse a temporary name for a different value within the same method. Each
temporary should be assigned once.

### Method Arguments

Arguments are named after the **expected type**, prefixed by an article (`a`, `an`):

```smalltalk
add: anObject
name: aString
at: anInteger put: anObject
```

When the type prefix is not possible or desirable, use temporary-naming rules instead.

### Block Arguments

Block arguments are short, typically one word (often a single letter when the block
is small and the meaning is clear from context):

```smalltalk
self do: [:each | each process].
self collect: [:x | x squared].
self keysAndValuesDo: [:k :v | ...].
```

### Selectors

Method selectors should be **short and succinct**, one or two words if possible:

```smalltalk
"Good"
#elements

"Acceptable"
#elementsArray

"Avoid"
#arrayOfElements
```

### Instance Variables and Class Names

Keep them short and concise, following the same spirit as temporaries.

### No Abbreviations

Do not abbreviate words in names. Use the full word:

```smalltalk
"Avoid"
cmdNew
reqCount
msg

"Preferred"
commandNew
requestCount
message
```

## Methods

### Keep Methods Short

Avoid long methods. Ideally a method has one level of iteration and a clear
single purpose. Factor complex logic into helper methods and let the compiler
optimize.

```smalltalk
"Avoid"
baz
    collection do: [:elem |
        "first do this"
        ...bunch of code...
        "then do that"
        ...more code...]

"Preferred"
baz
    collection do: [:elem |
        self doThis: elem; doThat: elem]
```

### No Nested Loops

Nested loops are highly discouraged. Factor the inner loop into its own method:

```smalltalk
"Avoid"
foo
    [aCollection isEmpty] whileTrue: [
        last := aCollection removeLast.
        aCollection do: [:other | last use: other]]

"Preferred"
foo
    [aCollection isEmpty] whileTrue: [
        last := aCollection removeLast.
        self useOthers: aCollection with: last]

useOthers: aCollection with: anObject
    aCollection do: [:other | anObject use: other]
```

### No Keyword Message as Argument of Keyword Message

Use a temporary to break the nesting:

```smalltalk
"Avoid"
self foo: (self bar: aBaz)

"Preferred"
bar := self bar: aBaz.
self foo: bar
```

### No Comments

Comments are **not allowed**, except:
- As headers in methods that define public APIs.
- For _very_ special reasons (which almost never exist).

If you feel the need to write a comment in the middle of a method, refactor the
code into another method or create appropriate objects to make the code self-explanatory.

## Formatting

### File Structure (Tonel format)

Each `.st` file starts with an optional copyright header as a string literal,
followed by the class definition and then methods. Class definitions use the
standard Tonel syntax:

```smalltalk
"
    Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
"

Class {
    #name : #MyClass,
    #superclass : #Object,
    #instVars : [
        'first',
        'second'
    ],
    #category : #Kernel
}
```

### Method Definitions

Each method is preceded by a category pragma and a blank line separates methods:

```smalltalk
{ #category : #accessing }
MyClass >> selector [
    ^value
]

{ #category : #accessing }
MyClass >> selector: anObject [
    value := anObject
]
```

### Indentation

- Use **one tab** for indentation inside method bodies.
- Continuation lines in cascades and multi-keyword messages are indented with
  one extra tab.

### Brackets and Blocks

- Opening brackets `[` stay on the same line as the expression that introduces them.
- Closing brackets `]` go on their own line only when the block spans multiple lines
  and aligns with the opening expression. Short blocks stay on a single line.

```smalltalk
"Single-line block"
self do: [:each | each process].

"Multi-line block"
self do: [:element | 
    separate ifTrue: [separatorBlock value] ifFalse: [separate := true].
    aBlock evaluateWith: element]
```

### Return Statements

Use `^` (caret) with a space before the returned expression. Early returns are the
preferred pattern for guard clauses:

```smalltalk
self isEmpty ifTrue: [^nil].
```

### Cascades

Cascades are preferred when sending multiple messages to the same receiver. For
more than two or three sends, break them across lines:

```smalltalk
"Short cascade on one line"
^self new add: anObject; yourself

"Long cascade across lines"
^self new
    add: object1;
    add: object2;
    add: object3;
    yourself
```

### Multi-keyword Selectors

When a method selector with many keywords is too long for one line, put each keyword
on its own line:

```smalltalk
Collection class >> with: object1
with: object2
with: object3
with: object4 [
    ^self new
        add: object1;
        add: object2;
        add: object3;
        add: object4;
        yourself
]
```
