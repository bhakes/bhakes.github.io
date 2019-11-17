import Cocoa
import Swift

func sayHello(to name: String) -> String {
    return "Hello, \(name)!"
}

sayHello(to: "Ben") // prints "Hello, Ben!"


func multiplyByTwo(_ int: Int) -> Int {
    return int * 2
}

multiplyByTwo(2)
multiplyByTwo(3)
multiplyByTwo(50)


func sayHelloWorld() -> Void {
    print("Hello, World!")
}

sayHelloWorld() // prints "Hello, World!"

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

[1, 2, 3].map { (int) in
    int * 3
}

func higherOrderFunction(array: [Int], transform: (Int) -> Int) -> [Int] {
    var newArray: [Int] = []
    for int in array {
        let transformedInt = transform(int)
        newArray.append(transformedInt)
    }
    return newArray
    
}



func multiplyByThree(int: Int)-> Int {
    return int * 3
}

func decrement(_ int: Int) -> Int {
    return int - 1
}

let multiplyByThree2 = { (int) in
    return int * 3
}

let decrement2 = { (int) in
    return int - 1
}

higherOrderFunction(array: [1, 2, 3], transform: multiplyByThree)
higherOrderFunction(array: [-1, 0, 1], transform: multiplyByThree)
higherOrderFunction(array: [1, 2, 3], transform: multiplyByThree2)
higherOrderFunction(array: [-1, 0, 1], transform: multiplyByThree2)
higherOrderFunction(array: [1, 2, 3], transform: decrement)
higherOrderFunction(array: [-1, 0, 1], transform: decrement)
higherOrderFunction(array: [1, 2, 3], transform: decrement2)
higherOrderFunction(array: [-1, 0, 1], transform: decrement2)
