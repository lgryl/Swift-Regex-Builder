# Swift Regex Builder #
A Swift library for expressing regural expressions in more natural, more expressive and easier to use way.

## Problem ##

Here is an example regex:

`(uu)?id +?= +?"\[\w{2,}-\d+]"`

for matching something as simple as:

`uuid = "[en-03]"`

The problem with regural expressions is that even for simple cases, they can be quite hard to read.
With all the brackets, backslashes (and double backslashes) and special characters, it requires a lot of brainpower to process them.

The other thing is that it's really easy to produce an arror when writing or editing one. Usually strings we type are not validated in any way, so it's no uncommon to use, for example, `.` instead of `\.`.

And regural expressions are often much more complex than the example above.

## Solution ##

The solution for this problem is to use a [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) specialized for creating regural expressions patterns.

Here is an example of the above regex, expressed with the Swift Regex Builder:
```Swift
let regex = Regex {
            Literal("uu")
                .repeatedZeroOrOneTime()
            Literal("id")
            Literal(" ")
                .repeatedOneOrMoreTimes(mode: .lazy)
            Literal("=")
            Literal(" ")
                .repeatedOneOrMoreTimes(mode: .lazy)
            Literal(#""["#)
            AnyWordCharacter()
                .repeated(atLeast: 2)
            Literal("-")
            AnyDigit()
                .repeatedOneOrMoreTimes()
            Literal(#"]""#)
        }
```

## Benefits ##

There are many benefits of using Swift Regex Builder over manually typing regural expressions, including:
* it's easy to use
* it's more friendly for people not familiar with regural expressions
* it's much more expressive and easy to read
* when you come back to it months later, you will understand it just as well as at the time of writing
* it's much harder to make a mistake

## Available Expressions ##

There is a number of expressions available to you to create your expression.

### Literal ###
Any text that should be matched literally. Any special characters are being escaped.

```Swift
Literal("user")
```

### Any character ###
Any character that is not a new line (\n) character.

```Swift
AnyCharacter()
```

### Digit ###
Any digit (from 0 to 9).

```Swift
AnyDigit()
```

### Non-digit ###
Any character, that is not a digit.

```Swift
AnyNonDigit()
```

### Word character ###
Any letter, digit, or underscore (_).

```Swift
AnyWordCharacter()
```

### Non-word character ###
Any character that is not letter, digit, and underscore (_).

```Swift
AnyNonWordCharacter()
```

### New line ###
Line break (\n).

```Swift
NewLine()
```

### Line start ###
Beggining of a line.

```Swift
LineStart()
```

### Line end ###
End of a line.

```Swift
LineEnd()
```

### Group ###
Group of expressions that should be joined together.

```Swift
Group {
  Literal("id")
  AnyCharacter()
  Literal("number")
}
```

### Alternative ###
Group of expressions, from which (at least) one should be matched.

```Swift
Alternative {
  Literal("user")
  Group {
    Literal("person")
    Literal("s")
      .repeatedZeroOrOneTime()
  }
}
```

## Available Modifiers ##

### Preceded by ###
Expression should appear before, but should not be matched.

```Swift
Literal("html")
    .precededBy {
        Literal("<")
    }
```

### Followed by ###
Expression should appear after, but should not be matched.
```Swift
Literal("html")
    .followedBy {
        Literal(">")
    }
```

### Repeated ###
Expression should be repeated given number of times.

```Swift
AnyCharacter()
    .repeated(3)
```

### Repeated at least ###
Expression should be repeated at least given number of times.

```Swift
AnyWordCharacter()
    .repeated(atLeast: 3)
```

### Repeated from to ###
Expression should be repeated number of times within given range.

```
AnyWordCharacter()
    .repeated(from: 1, to: 10)
```

### Repeated zero or one time ###
Expression should be repeated at most one time.

```Swift
Literal("user")
    .repeatedZeroOrOneTime()
```

### Repeated zero or more times ###
Expression should be repeated arbitrary number of times, including zero.

```Swift
AnyCharacter()
    .repeatedZeroOrMoreTimes()
```
### Repeated one or more times ###
Expression should be repeated at least one time.

```Swift
Literal(" ")
    .repeatedOneOrMoreTimes(mode: .lazy)
```
