//
//  Closures.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 31.10.22.
//

import Foundation

func closures() {
    let names = ["Chirs", "Alex", "Ewa", "Barry", "Daniella"]
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    var reversedNames = names.sorted(by: backward)
    print(reversedNames) // ["Ewa", "Daniella", "Chirs", "Barry", "Alex"]
    
    // 闭包表达式
    // { (parameters) -> return type in
    //      statements
    //  }
    reversedNames = names.sorted(by: {
        (s1: String, s2: String) -> Bool in
        return  s1 > s2
    })
    print(reversedNames) // ["Ewa", "Daniella", "Chirs", "Barry", "Alex"]
    
    // 根据上下文推断类型
    reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})
    print(reversedNames) // ["Ewa", "Daniella", "Chirs", "Barry", "Alex"]
    
    // 隐式返回
    reversedNames = names.sorted(by: {s1, s2 in s1 > s2})
    
    // 参数名称缩写
    reversedNames = names.sorted(by: {$0 > $1})
    
    // 运算符方法
    reversedNames = names.sorted(by: >)
    
    // 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，将这个闭包替换成为尾随闭包的形式很有用。尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签：
    func someFunctionThatTakesAClosure(closure: () -> Void) {
        // 函数整体部分
    }
    
    someFunctionThatTakesAClosure(closure: {
        // 闭包主体部分
    })
    
    // 尾随闭包进行函数调用
    someFunctionThatTakesAClosure() {
        // 闭包主体部分
    }
    
    reversedNames = names.sorted() { $0 > $1 }
    
    // 省略版本
    reversedNames = names.sorted { $0 > $1 }
    
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    let numbers = [16, 58, 510]
    
    // 其实就是函数式编程
    let strings = numbers.map {
        (number) -> String in
        var number = number
        var output = ""
        repeat {
            output = digitNames[number % 10]! + output
            number /= 10
        } while number > 0
        return output
    }
    
    print(strings) // ["OneSix", "FiveEight", "FiveOneZero"]
    
//    func loadPicture(from server: Server, completion:(Picture) -> Void,
//                     onFailure: () -> Void) {
//        if let picture = download("photo.jpg", from: server) {
//            completion(picture)
//        } else {
//            onFailure()
//        }
//    }
//
//    loadPicture(from: someServer){    picture in
//        someView.currentPicture = picture
//    } onFailure: {
//        print("Couldn't download the next picture.")
//    }
    
    func makeIncrementer(forIncrement amount:Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    
    let incrementByTen = makeIncrementer(forIncrement: 10)
    print(incrementByTen()) // 10
    print(incrementByTen()) // 20
    print(incrementByTen()) // 30
    
    let incrementBySeven = makeIncrementer(forIncrement: 7)
    print(incrementBySeven()) // 7
    print(incrementByTen()) // 40
    
    let alsoIncrementByTen = incrementByTen
    print(alsoIncrementByTen()) // 50
    
    // 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
    // todo 存在问题 Closure captures 'completionHandlers' before it is declared
//    var completionHandlers: [() -> Void] = []
//    func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//        completionHandlers.append(completionHandler)
//    }
//
//    func someFunctionWithNonescapingClosure(closure: () -> Void) {
//        closure()
//    }
//
//    class SomeClass {
//        var x = 10
//        func doSomething() {
//            someFunctionWithEscapingClosure { self.x = 100 }
//            someFunctionWithNonescapingClosure { x = 200 }
//        }
//    }
//
//    let instance = SomeClass()
//    instance.doSomething()
//    print(instance.x)
//    // 打印出“200”
//
//    completionHandlers.first?()
//    print(instance.x)
//    // 打印出“100”
    
    var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    print(customersInLine.count)
    // 打印出“5”
    
    let customersProvider = { customersInLine.remove(at: 0) }
    print(customersInLine.count)
    
    print("Now Serving \(customersProvider())")
    print(customersInLine.count)
    
    // customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
    // serve(customer:) 函数接受一个返回顾客名字的显式的闭包
    func serve(customer customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve(customer: { customersInLine.remove(at: 0) } )
    // 打印出“Now serving Alex!”
    
    // 下面这个版本的 serve(customer:) 完成了相同的操作，不过它并没有接受一个显式的闭包，而是通过将参数标记为 @autoclosure 来接收一个自动闭包。现在你可以将该函数当作接受 String 类型参数（而非闭包）的函数来调用。customerProvider 参数将自动转化为一个闭包，因为该参数被标记了 @autoclosure 特性。
    // customersInLine is ["Ewa", "Barry", "Daniella"]
    func serve(customer customerProvider: @autoclosure () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve(customer: customersInLine.remove(at: 0))
    // 打印“Now serving Ewa!”
    
    // customersInLine i= ["Barry", "Daniella"]
    var customerProviders: [() -> String] = []
    func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
        customerProviders.append(customerProvider)
    }
    collectCustomerProviders(customersInLine.remove(at: 0))
    collectCustomerProviders(customersInLine.remove(at: 0))

    print("Collected \(customerProviders.count) closures.")
    // 打印“Collected 2 closures.”
    for customerProvider in customerProviders {
        print("Now serving \(customerProvider())!")
    }
    // 打印“Now serving Barry!”
    // 打印“Now serving Daniella!”
}
