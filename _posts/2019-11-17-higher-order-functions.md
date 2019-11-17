---
layout: post
title: "Higher-Order Functions"
author: "Ben Hakes"
categories: journal
tags: [Functions, Swift, Higher-Order Functions]
image: higherorderfunctions.png
---

For the next few posts, I will be covering some basic functional programming concepts in `Swift`. Today, I'll start off very basic, and will be discussing the idea of `Higher-Order Functions`.

## Motivation
`Higher-Order Functions` exist everywhere in `Swift`, and are an important concept to master when starting to dive deeper into functional programming.

## What are functions in the first place?
``` 
The essence of mathematics lies in its freedom.

- Georg Canter.
```

Before we dive into exactly what `Higher-Order Functions` are, we probably should define what a `function` means.

We use the word function in every day life, but, within the context of mathematics and programming, the word `function` has a specific meaning. The definition in computer science draws upon its (earlier) definition in math.

The math [definition](https://en.wikipedia.org/wiki/Function_(mathematics)) of a function is as follows:
```
A function is a process that associates to each element of a set X a single element of a set Y.
```
At its essence, a function is said to "map" elements from one set to another.

Now let's take a look at the [definition](https://en.wikipedia.org/wiki/Subroutine) of a function in programming, which is sometimes called a "subroutine".
```
A function (or subroutine) is a sequence of program instructions that performs a specific task, packaged as a unit.
```
If you "squint", you can see the mathematical defintion of a function imbedded in this, more specific, defintion of a function. When invoked, a programming function, or subroutine, "maps" each possible element of a set of inputs to each possible set of outputs. In programming, the set of inputs (the set X) is all of the possible commands or inputs values the programmer (or another computer) can provide as input to the function. The set of outputs (the set Y), is all of the possible output values that the function can generate, based on the set of possible input values.

## Functions in Swift

Now that we are starting to develop an intuition for what a function is in the context of math and programming, let's take a look at how to implement a function in `Swift`.

```swift

func sayHello(to name: String) -> String {
    return "Hello, \(name)!"
}

sayHello(to: "Ben") // prints "Hello, Ben!"

```

Let's describe the function above using the language we learned from the mathematical definition of a function. Again, just like all functions, the function above "maps" each element of a set X, to a single element of a set Y. In this case `sayHello(to:)` maps the set of all possible `String` input values to the string's input value prepended with "Hello, " and appended with "!".

If we were to enumerate the mapping from the set X (often called the "domain") to the set Y (often called to "range"), the set of possible values might start looking like this:
```swift
("Ben", "Hello, Ben!")
("Bob", "Hello, Bob!")
("Alice", "Hello, Alice!")
("12345", "Hello, 12345!")
.
.
...
```
And so on ad-infinitum. In the the case of this function, it's domain and range are infinite, i.e., there are infiinitely many character combinations that could be provided to this function.

Let's take another function:

```swift
func multiplyByTwo(_ int: Int) -> Int {
    return int * 2
}

multiplyByTwo(2) // returns 4
multiplyByTwo(3) // returns 6
multiplyByTwo(50) // returns 100

```
If we were to enumerate the mapping of the function above, the set of possible values might start looking like this:
```swift
...
.
.
(-1, -2)
(0, 0)
(1, 2)
(2, 4)
.
.
...
```
Again, we are dealing with a function with an infinite domain (set X) and an infinite range (set Y).

## Function Descriptions in Swift
In both example functions above, each function took in an input and produced an output. Furthermore, in both of the examples above, each function took in a specific `Type` and produced a specific `Type`. In the first, `sayHello` took in a `String` and produced a `String`. In the second, `multiplyByTwo` took `Int` inputs and output another `Int`. 

Types don't have to align in functions. For instance, you could think of a function, `depositInYourBankAccount` that takes an `Int` input and returns a `String` output such as "You now have (x) dollars in your bank account."

One way of describing a function's "interface" is to describe the `Types` that are valid for its domain and range. To use our example functions
```
sayHello is a function from String to String, or: 
(String) -> (String)

multiplyByTwo is a function from Int to Int, or:
(Int) -> (Int)

depositInYourBankAccount is a function from Int to String, or:
(Int) -> (String)
```

It is acutally not even a requirement for a function to have a input type or an output type.

```swift

func sayHelloWorld() -> Void {
    print("Hello, World!")
}

sayHelloWorld() // prints "Hello, World!"

```
The function `sayHelloWorld` above take no inputs and returns a `Void` output, which basically means that it returns nothing.

```
sayHelloWorld is a function from Void to Void, or:
(1): Void -> Void 
(2): () -> Void // equivalent to 1
(3): () -> () // equivalent to 1 and 2
```

## Functions with Multiple Parameters 

Generally speaking, functions can take 0 to N parameters and return 0 to N parameters. For instance, the function below shows an example of a function that has multiple input parameters:
```swift
enum TimeOfDay: String{
    case morning
    case afternoon
    case evening
}

func greet(person name: String, for timeOfDay: TimeOfDay) -> String {
    return "Good \(timeOfDay), \(name)!"
}

greet(person: "Ben", for: .morning) // returns "Good morning, Ben!"
greet(person: "Bob", for: .afternoon) // returns "Good afternoon, Bob!"
greet(person: "Alice", for: .evening) // returns "Good evening, Alice!"

```
The function above can be described as a function that "maps" `String` names and `TimeOfDay` enums to `String`s. Or, in symbolic form: `(String, TimeOfDay) -> (String)`. 

We could also come up with another function that was very similar to `greet(person:for:)` but also returned a random integer with the `String` greeting. That function's interface could be described as `(String, TimeOfDay) -> (String, Int)`.

## Higher-Order Functions
So far, we've only focused on functions that take basic `Types` as input and output parameters, like `String`, `Int`, and `Void`. We did, however, manage to create our own type in the last section, namely, the `TimeOfDay` type, which was just an `Enum` with three cases. You might be wondering at this point: 
```
"How complicated can we get with our input and output parameters?
```

The answer is: "pretty crazy". In fact, we can pass in _functions_ as parameters and return _functions_ as parameters. The former, is, in fact, exactly what a higher-order function is!

The definition of a higher-order function:
```
A function that takes in one or more functions as input parameters.

```

Let's see an example:
```swift

func higherOrderFunction(array: [Int], transform: (Int) -> Int) -> [Int] {
    var newArray: [Int] = []
    for int in array {
        let transformedInt = transform(int)
        newArray.append(transformedInt)
    }
    return newArray
    
}

```
In the example higher-order function above we have two input parameters. The first is an array of `Int`s, and the second is a function we're calling `transform`, which can be _any function_ that takes an `Int` as input and returns `Int` as output. What might an example of a `transform` function be? `transform` could be `multiplyByThree` which takes an `Int` and multiplies it by three. Or `transform` could be `decrement`, which takes the passed `Int` and decrements it by one. All that is required is that it takes an `Int` input value and returns an `Int`.

Let's put this new higher order function to work with some of our examples above:

```swift

func multiplyByThree(int: Int)-> Int {
    return int * 3
}

func decrement(_ int: Int) -> Int {
    return int - 1
}

higherOrderFunction(array: [1, 2, 3], transform: multiplyByThree) // returns `[3, 6, 9]`
higherOrderFunction(array: [-1, 0, 1], transform: multiplyByThree) // returns `[-3, 0, 3]`
higherOrderFunction(array: [1, 2, 3], transform: decrement) // returns `[0, 1, 2]`
higherOrderFunction(array: [-1, 0, 1], transform: decrement) // returns `[-2, -1, 0]`

```

Note that both `multipleByThree` and `decrement` satisfy the `Type` condition that the definition of `transform` requires.

In the above, we have written `multipleByThree` and `decrement` in the `func` syntactic style. But sometimes, especially when functions are passed to as parameters to higher-order functions, it is more common to write functions in the `closure` style below:

```swift

let multiplyByThree2 = { (int) in
    return int * 3
}

let decrement2 = { (int) in
    return int - 1
}

higherOrderFunction(array: [1, 2, 3], transform: multiplyByThree)  // returns `[3, 6, 9]`
higherOrderFunction(array: [-1, 0, 1], transform: multiplyByThree) // returns `[-3, 0, 3]`
higherOrderFunction(array: [1, 2, 3], transform: multiplyByThree2)  // returns `[3, 6, 9]`
higherOrderFunction(array: [-1, 0, 1], transform: multiplyByThree2) // returns `[-3, 0, 3]`
higherOrderFunction(array: [1, 2, 3], transform: decrement) // returns `[0, 1, 2]`
higherOrderFunction(array: [-1, 0, 1], transform: decrement)  // returns `[-2, -1, 0]`
higherOrderFunction(array: [1, 2, 3], transform: decrement2) // returns `[0, 1, 2]`
higherOrderFunction(array: [-1, 0, 1], transform: decrement2)  // returns `[-2, -1, 0]`

```

In the example above, the function, `multiplyByThree2` is a constant that is passed into the `higherOrderFunction`.

## Higher-Order Functions in the Standard Library

So you might be thinking, "Okay that's pretty cool, but is this all that common? Would it be safe to avoid this when possible? Is there any precedent from Apple for making higher-order functions?"

In fact, higher-order functions ship as standard, and essential pieces, of the `Swift` standard library. Functions on like `map`, `reduce`, `filter`, `flatMap`, `compactMap` are all higher-order functions!

In a future post, we'll dive into those and learn more about their operation and just how fundamental they are!
