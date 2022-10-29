//
//  BasicOperators.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 28.10.22.
//

import Foundation

func basicOperators() {
    
    // 赋值运算符
    assignmentOperator()
    
    // 算术运算符
    arithmeticOperators()
    
    // 区间运算符
    rangeOperators()
}

// 赋值运算符
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/02_basic_operators#assignment-operator
private func assignmentOperator() {
    let b = 10
    var a = 5
    a = b // a现在等于10
    
    let (x,y) = (1,2) // 现在x等于1，y等于2
//    if x = y {
//      无效语句
//    }
}

// 算术运算符
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/02_basic_operators#arithmetic-operators
private func arithmeticOperators() {
    1 + 2 // 等于3
    5 - 3 // 等于2
    2 * 3 // 等于6
    10.0 / 2.5 // 等于4.0
    
    "hello, " + "world" // 等于"hello, world"
    
    9 % 4 // 求余，等于1
    -9 % 4 // 等于 -1
    
    let three = 3
    let minusThree = -three  // -3
    let plusThree = -minusThree // 3
    
    let minusSix = -6
    let alsoMinusSix = +minusSix // -6 +不做任何改变
    
    var a = 1
    a += 2 // a现在是3
    
    1 == 1 // true
    2 != 1 // true
    2 > 1 // true
    1 < 2 // true
    1 >= 1 // true
    2 <= 1 // false
    
    let name = "world"
    if name == "world" {
        print("hello, world") // 输出hello, world
    } else {
        print("I'm sorry \(name), but I don't recognize you")
    }
    
    // 比较运算符
    (1, "zebra") < (2, "apple")  // true，1 < 2
    (3, "apple") < (3, "bird")  // 3 = 3, apple < bird
    (4, "dog") == (4, "dog")  // 4 = 4, dog = dog
    
    ("blue", -1) < ("purple", 1) // 正常，比较结果为true
//    ("blue", false) < ("purple", true) // 错误，不能比较布尔类型
    
    // 三元运算符
    let contentHeight = 40
    let hasHeader = true
    let rowHeight = contentHeight + (hasHeader ? 50 : 20) //90
    
    // 空合运算符(nil coalescing operator)
    let defaultColorName = "red"
    var userDefinedColorName: String?
    // userDefinedColorName的值为空，所以corlorNameToUse的值为red
    var colorNameToUse = userDefinedColorName ?? defaultColorName
    print(colorNameToUse)
    
    userDefinedColorName = "green"
    // userDefinedColorName 非空，因此colorNameToUse的值为"green"
    colorNameToUse = userDefinedColorName ?? defaultColorName
    print(colorNameToUse)
}

// 区间运算符
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/02_basic_operators#range-operators
private func rangeOperators() {
    for index in 1...5 {
        print("\(index) * 5 = \(index * 5)")
    }
    
    let names = ["Anna", "Alex", "Brina", "Jack"]
    let count = names.count
    // 数组下标
    for i in 0..<count {
        print("第 \(i + 1) 个人叫 \(names[i])")
    }
    
    // 从第三个开始
    for name in names[2...] {
        print(name)
    }
    
    // 到第三个
    for name in names[...2] {
        print(name)
    }
    
    // 前两个
    for name in names[..<2] {
        print(name)
    }
    
    let range = ...5
    range.contains(7)  // false
    range.contains(4)  // true
    range.contains(-1) // true
    
    // 逻辑运算符
    let allowedEntry = false
    if !allowedEntry { // 非运算符
        print("ACCESS DENIED")
    }
    
    let enteredDoorCode = true
    let passedRetinaScan = false
    if enteredDoorCode && passedRetinaScan { // 与，跟Java一样
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
    
    let hasDoorKey = false
    let knowsOverridePassword = true
    if hasDoorKey || knowsOverridePassword { // 或，跟Java一样
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
    // 输出“Welcome!”
    
    if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword { //连续计算
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
    // 输出“Welcome!”
    
    if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword { // 确定优先级
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
    // 输出“Welcome!”
}
