---
layout: post
title: "Design Patterns: Facade"
author: "Ben Hakes"
categories: journal
tags: [Design Patterns, Swift, Facade]
image: door.jpg
---

# The Facade Design Pattern
In this post, I will take a look at the `Facade` design pattern, and will implement the pattern in Swift.

## Pattern Intent
``` 
Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.

- Erich Gamma, et al., Design Patterns: Elements of Resuable Object-Oriented Software, 185.
```

## Motivation
The `Facade` pattern is useful for reducing the complexity of client communications with subsystem components.

Often different clients need to access different components within a related subsystem. One way to set up communication would be to have each client establish communication with each subcomponent that it wants to use. But this can quickly get complicated, especially if setting up a connection with a subcomponent is relatively complicated.

The `Facade` pattern solves this problem by creating a single common “interface” for which clients can interact with subsystem components. The `Facade` itself establishes the relationship with those subsystem components.

## Applicability
So when could this be useful? Well, here are some cases:
- Use the `Facade` pattern when you want to provide a simple interface to a complex subsystem. This about the gas pedal on a car. The gas pedal, as an interface is very simple. What goes on when the pedal is pushed down is much more complex. You can use `Facade` to hide, or _abstract_, some complexity from the client. 
- When want to decouple many different clients from the subsystems implementation. Here a `Facade` decouple the subsystems from the clients and promotes more subsystem independence.
- When you want to layer your subsystems. `Facade`s can be used as entry points to different layers of a subsystem.

## Participants
1. *Facade*
- Know which subsystem classes are responsible for a request
- Delegates client request to the appropriate component
2. *Subsystem Classes*
- implement the subsystem functionality
- handle work assigned by the `Facade` object
- have know knowledge or reference to the facade.

— Erich Gamma, et al., Design Patterns: Elements of Resuable Object-Oriented Software, 187

## Collaborations
- Clients send messages to the Facade, which passes them on the the appropriate subsystem
- Clients don’t have access to the subsystem classes.

## Benefits
1. Makes subsystems easier to use for clients
2. Promotes “weak coupling” between the subsystem and its clients.
3. It doesn’t prevent applications from using subsystem classes if they need to.


## Code Sample

The following code sample is a handy little Facade pattern for accessing and manipulating `UserDefaults`. This was source from [this repository](https://github.com/ochococo/Design-Patterns-In-Swift/blob/master/source/structural/facade.swift). 

```swift
/*:

🎁 Façade

---------



The facade pattern is used to define a simplified interface to a more complex subsystem.



### Example

*/

final class Defaults {




private let defaults: UserDefaults




init(defaults: UserDefaults = .standard) {

self.defaults = defaults

}




subscript(key: String) -> String? {

get {

return defaults.string(forKey: key)

}




set {

defaults.set(newValue, forKey: key)

}

}

}

/*:

### Usage

*/

let storage = Defaults()




// Store

storage[“Bishop”] = “Disconnect me. I’d rather be nothing”




// Read

storage[“Bishop”]
```
