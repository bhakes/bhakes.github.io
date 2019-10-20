---
layout: post
title: "Design Patterns: Prototype"
author: "Ben Hakes"
categories: journal
tags: [Design Patterns, Swift, Prototype]
image: prototype.jpg
---

In this post, I will take a look at the `Prototype` design pattern, a common `Creational` design pattern, and will implement the pattern in Swift.

## Pattern Intent
``` 
Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.

- Erich Gamma, et al., Design Patterns: Elements of Resuable Object-Oriented Software, 117.
```

## Motivation
The `Prototype` pattern is useful for easily creating new instances of a class or struct by "copying" or cloning another instance.

## Applicability

Generally speaking, you should use the `Prototype Pattern`  when a system should be independent of how its products are created, composed, and represented.

So when could this be useful? Well, here are some cases:
- When the classes to instantiate are specified at run-time, for example, by dynamic loading; or
- To avoid building a class heirarchy of factories that parallels the class heirarchy of products; or
- When instances of a class can have one of only a few different combinations of state.

## Participants
1. *Prototype*
- Declares an interface for cloning itself
2. *Concrete Prototyp*
- Implements an operation for cloning itself
3. *Client
- Creates a new object by asking a prototype to clone itself
— Erich Gamma, et al., Design Patterns: Elements of Resuable Object-Oriented Software, 119

## Collaborations
- Clients ask the prototype to clone itself.

## Benefits
1. Potentially reduce the number of classes/structs a system needs

## Note
Languages like Smalltalk and Objective C, which treat classes as first-class objects, derive less benefit from the prototype pattern because you can always just use a class object as a creator. Class objects already act like prototypes in these languages.

## Code Sample

The following code sample implements a facade pattern via a `MoonWorker` struct and. This was source from [this repository](https://github.com/ochococo/Design-Patterns-In-Swift/blob/master/source/creational/prototype.swift). 

```swift
/*:
🃏 Prototype
------------
The prototype pattern is used to instantiate a new object by copying all of the properties of an existing object, creating an independent clone. 
This practise is particularly useful when the construction of a new object is inefficient.
### Example
*/
struct MoonWorker {

    let name: String
    var health: Int = 100

    init(name: String) {
        self.name = name
    }

    func clone() -> MoonWorker {
        return MoonWorker(name: name)
    }
}
/*:
### Usage
*/
let prototype = MoonWorker(name: "Sam Bell")

var bell1 = prototype.clone()
bell1.health = 12

var bell2 = prototype.clone()
bell2.health = 23

var bell3 = prototype.clone()
bell3.health = 0
```

