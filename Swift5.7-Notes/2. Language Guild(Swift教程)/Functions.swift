//
//  Functions.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 31.10.22.
//

import Foundation

func functions() {
    func greet(person: String) -> String {
        let greeting = "Hello, " + person + "!"
        return greeting
    }
    print(greet(person: "Anna"))  // Hello, Anna!
    print(greet(person: "Brain")) // Hello, Brain!
    
    func greetAgain(person: String) -> String {
        return "Hello again, " + person + "!"
    }
    print(greetAgain(person: "Anna")) // Hello again, Anna!
    
    func sayHelloWorld() -> String {
        return "hello, world"
    }
    print(sayHelloWorld()) // hello, world
    func greet(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return greetAgain(person: person)
        } else {
            return greet(person: person)
        }
    }
    print(greet(person: "Tim", alreadyGreeted: true)) // Hello again, Tim!
    
    func greetVoid(person: String) {
        print("Hello, \(person)")
    }
    greetVoid(person: "Dave")
    
    func printAndCount(string: String) -> Int {
        print(string)
        return string.count
    }
    
    func printWithoutCouting(string: String) {
        let _ = printAndCount(string: string)
    }
    
    let count = printAndCount(string: "hello, world")
    print(count)
    printWithoutCouting(string: "hello world")
    
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
    print("min is \(bounds.min) and max is \(bounds.max)") // min is -6 and max is 109
    
    func minMaxOptional(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty {
            return nil
        }
        
        return minMax(array: array)
    }
    if let bounds = minMaxOptional(array: [8, -6, 2, 109, 3, 71]) {
        print("min is \(bounds.min) and max is \(bounds.max)") // min is -6 and max is 109
    }
    
    // 隐式返回
    func greeting(for person: String) -> String {
        "Hello, " + person + "!"
    }
    print(greeting(for: "Dave")) // Hello, Dave!
    
    func anotherGreeting(for person: String) -> String {
        return "Hello, " + person + "!"
    }
    
    print(anotherGreeting(for: "Dave")) // Hello, Dave!
    
    func someFunction(firstParameterName: Int, secondParameterName: Int) {
        // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    }
    someFunction(firstParameterName: 1, secondParameterName: 2)
    
    func someFunction(argumentLabel parameterName: Int) {
        // 在函数体内，parameterName 代表参数值
    }
    
    func greet(person: String, from hometown: String) -> String {
        return "Hello \(person)!  Glad you could visit from \(hometown)."
    }
    print(greet(person: "Bill", from: "Cupertino"))
    // 打印“Hello Bill!  Glad you could visit from Cupertino.”
    
    func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
         // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    }
    someFunction(1, secondParameterName: 2)
    
    func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
        // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
        print(parameterWithDefault)
    }
    someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
    someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12
    
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    print(arithmeticMean(1, 2, 3, 4, 5))
    print(arithmeticMean(3, 8.25, 18.75))
    
    // 引用传递，在swift中使用inout关键字
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    var someInt = 3
    var anotherInt = 107
    swapTwoInts(&someInt, &anotherInt)
    print("someInt is now \(someInt), and anotherInt is now \(anotherInt)") // someInt is now 107, and anotherInt is now 3
    
    // (Int, Int) -> Int类型的函数
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    // () -> Void
    func printHelloWorld() {
        print("hello, world")
    }
    
    var mathFunction: (Int, Int) -> Int = addTwoInts
    print("Result: \(mathFunction(2,3))") // Result: 5
    mathFunction = multiplyTwoInts
    print("Result: \(mathFunction(2,3))") // Result: 6
    let anotherMathFunction = addTwoInts // 推断类型
    
    // 函数作为参数
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    printMathResult(addTwoInts, 3, 5) // Result: 8
    
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward : stepForward
    }
    
    func returnFunction() {
        var currentValue = 3
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        // moveNearerToZero 现在指向 stepBackward() 函数。
        print("Counting to zero:")
        // Counting to zero:
        while currentValue != 0 {
            print("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }
        print("zero!")
        // 3...
        // 2...
        // 1...
        // zero!
    }
    returnFunction()
    
    // 嵌套函数
    func nestedFunction() {
        func chooseStepFunction(backward: Bool) -> (Int) -> Int {
            func stepForward(input: Int) -> Int { return input + 1 }
            func stepBackward(input: Int) -> Int { return input - 1 }
            return backward ? stepBackward : stepForward
        }
        var currentValue = -4
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        // moveNearerToZero now refers to the nested stepForward() function
        while currentValue != 0 {
            print("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }
        print("zero!")
        // -4...
        // -3...
        // -2...
        // -1...
        // zero!
    }
    nestedFunction()
}
