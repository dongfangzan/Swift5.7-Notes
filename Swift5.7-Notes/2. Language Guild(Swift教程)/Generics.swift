//
//  Generics.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 7.11.22.
//

import Foundation

private struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

private struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

private protocol Container {
    associatedtype Item // 关联类型
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

private struct IntStack2: Container {
    // IntStack 的原始实现部分
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // Container 协议的实现部分
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack2<Element>: Container {
    // Stack<Element> 的原始实现部分
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Array: Container {}

private protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension Stack2: SuffixableContainer {
    func suffix(_ size: Int) -> Stack2 {
        var result = Stack2()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // 推断 suffix 结果是Stack。
}

extension IntStack2: SuffixableContainer {
    func suffix(_ size: Int) -> Stack2<Int> {
        var result = Stack2<Int>()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // 推断 suffix 结果是 Stack<Int>。
}

func generics2() {
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temparayA = a
        a = b
        b = temparayA
    }
    var someInt = 3
    var anotherInt = 107
    swapTwoInts(&someInt, &anotherInt)
    print("someInt is now \(someInt), and anotherInt is now \(anotherInt)") // someInt is now 107, and anotherInt is now 3
    
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temparayA = a
        a = b
        b = temparayA
    }
    
    swapTwoValues(&someInt, &anotherInt)
    print("someInt is now \(someInt), and anotherInt is now \(anotherInt)") // someInt is now 3, and anotherInt is now 107

    var someString = "hello"
    var anotherString = "world"
    swapTwoValues(&someString, &anotherString)
    // someString 现在是“world”，anotherString 现在是“hello”
    print("someString is now \(someString), and anotherString is now \(anotherString)") // someString is now world, and anotherString is now hello
    
    
    
    var stackOfStrings = Stack<String>()
    stackOfStrings.push("uno")
    stackOfStrings.push("dos")
    stackOfStrings.push("tres")
    stackOfStrings.push("cuatro")
    
    let fromTheTop = stackOfStrings.pop()
    
    if let topItem = stackOfStrings.topItem {
        print("The top item on the stack is \(topItem).") // The top item on the stack is tres.
    }
    
    func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
    if let foundIndex = findIndex(ofString: "llama", in: strings) {
        print("The index of llama is \(foundIndex)") // The index of llama is 2
    }
    
    // 需要增加Equatable，否则报错
    func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    
    let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
    // doubleIndex 类型为 Int?，其值为 nil，因为 9.3 不在数组中
    let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
    // stringIndex 类型为 Int?，其值为 2
    
    var stackOfInts = Stack2<Int>()
    stackOfInts.append(10)
    stackOfInts.append(20)
    stackOfInts.append(30)
    let suffix = stackOfInts.suffix(2)
    // suffix 包含 20 和 30
    
    func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        return true
    }
    
    var stack2OfStrings = Stack2<String>()
    stack2OfStrings.push("uno")
    stack2OfStrings.push("dos")
    stack2OfStrings.push("tres")

    var arrayOfStrings = ["uno", "dos", "tres"]

    if allItemsMatch(stack2OfStrings, arrayOfStrings) {
        print("All items match.")
    } else {
        print("Not all items match.")
    }
    // 打印“All items match.”
}
