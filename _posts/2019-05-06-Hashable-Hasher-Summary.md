---
layout: post
title: "Summary of Hashable/Hasher (NSHipster)"
author: "Ben Hakes"
categories: journal
tags: [LambdaSchool,Swift,NSHipster,Hashable,Hasher]
image: fractal.jpg
---

This post represents a summary of an article on Hashable/Hasher from NSHipster. For every greater detail about this topic, check out the [full article](https://nshipster.com/hashable/).

### Hash Functions

Hash Functions are a foundational discrete mathematical concept that is incredibly important to modern computing. Wikipedia defines a Hash Function as:
> "...any function that can be used to map data of arbitrary size onto data of a fixed size."

Hash functions generally have the following properties:
- Given a hash function and an input, it is quick to compute the output (the "hash")
- They are determinisitc; so the same messsage (input) always results in the same hash (output).
- Ideally, two different inputs wouldn't create the same output (hash) very often (sometimes called a "hash collision").

Hashable and Hasher, both based on the concept of a hash function, are fundamental to the operation of Swift Dictionaries and Sets.

### Time Complexity of Hash Functions

Hash functions are useful because they allow us to look information up faster. Let's say we have a string array of length `n` we want to search for the string "pig" in that array. At worst, "pig" is listed at the end of the array, or possibly not listed at all. If `n` was small, say 10 strings or less, this wouldn't be such a problem. But what if `n` was large? What if `n` was 3 billion lines long? That would be a pain. 

In computer science and mathematics, we would say that the "time complexity" of an array is "Big Oh of n", or "linear", or "O(n)". This means that as the array gets to `n` size, it takes `n` computations, in the worst case, to find "pig".

On the other hand, with hash functions, the time complexity is "Big Oh of 1", or "constant", or "O(1)". This is because instead of storing the elements sequentially, like in an array, one can store them  by computing a hash as an "index", with that hash based on the contents of the string. Instead of searching for "pig" blindly through an array, one can now use the hash of "pig" (in this case the index) to find the index value we care about immediately, instead of searching like in the array.

When you perform a lookup of an object in a set or dictionary in Swift, the compiler uses a similar technique to perform computations at, or at least close to, constant time, or O(1).

### Hashable
Previously in Swift, it took a lot of boilerplate code just to make an object conform to `Hashable` and was generally a pain for most developers. It also had downsides that developers often unintentionally created hashcollisions.

Starting with Swift 4.1, the compiler autmatically synthesizes conformance to the `Equatable` and `Hashable` protocols for types that adopt these protocols, as long as all of their members conform to the protocols. This eliminated a lot of extra code and headaches.

However, there were still some problems because, depending on exact data, different hash functions (yes, there are many) can perform differently.

### Hasher

Fortunately, Swift 4.2 refined `Hashable` by introducing a `Hasher` type and standardized the Swift universal hashing functions. You can now override how your type implements `Hashable` (see the code below for an example of this). Swift now abstracts low-level implementation details of `Hashable` making it easier to implement hash functions and ensures less chance of a developer created hash collision.

### Customizing Hash Functions

If you don't want to use the default Swift hash functions, you can use custom hash functions tailored to the problem you're working on. One cool example is [Zobrist Hashing](https://en.wikipedia.org/wiki/Zobrist_hashing) which is used to store the state of board games.

```swift
/* Now if you want to customize how your type implements Hashable, you can override the hash(into:) method instead of hashValue. The hash(into:) method passes a Hasher object by reference, which you call combine(_:) on to add the essential state information of your type.*/
// Via NSHipster
// Swift >= 4.2
struct Color: Hashable {
    let red: UInt8
    let green: UInt8
    let blue: UInt8

    // Synthesized by compiler
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.red)
        hasher.combine(self.green)
        hasher.combine(self.blue)
    }

    // Default implementation from protocol extension
    var hashValue: Int {
        var hasher = Hasher()
        self.hash(into: &hasher)
        return hasher.finalize()
    }
}

```