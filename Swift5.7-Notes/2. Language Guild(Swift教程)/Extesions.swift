//
//  Extesions.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 7.11.22.
//

import Foundation

// 不能写在函数中
extension Double {
    var km: Double { return self * 1_000.0}
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

private struct Size {
    var width = 0.0, height = 0.0
}

private struct Point {
    var x = 0.0, y = 0.0
}

private struct Rect {
    var origin = Point()
    var size = Size()
}


extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    mutating func square() {
        self = self * self
    }
    // 下标 [n] 返回从数字右侧开始的第 n 位数字
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
    // 增加嵌套类型
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func extensions() {
    let oneInch = 25.4.mm
    print("One inch is \(oneInch) meters") // One inch is 0.0254 meters
    
    let threeFeet = 3.ft
    print("Three feet is \(threeFeet) meters") // Three feet is 0.914399970739201 meters
    
    let aMarathon = 42.km + 195.m
    print("A marathon is \(aMarathon) meters long") // A marathon is 42195.0 meters long
    
    let defaultRect = Rect()
    let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
    
    let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                          size: Size(width: 3.0, height: 3.0))
    // centerRect 的 origin 是 (2.5, 2.5) 并且它的 size 是 (3.0, 3.0)
    
    3.repetitions {
        print("Hello!")
    }
    // Hello!
    // Hello!
    // Hello!
    
    var someInt = 3
    someInt.square()
    print("someInt is \(someInt).") // someInt is 9.
    
    print(746381295[0]) // 5
    print(746381295[1]) // 9
    print(746381295[2]) // 2
    print(746381295[8]) // 7
    print(746381295[9]) // 0
    
    func printIntegerKinds(_ numbers: [Int]) {
        for number in numbers {
            switch number.kind {
            case .negative:
                print("- ", terminator: "")
            case .zero:
                print("0 ", terminator: "")
            case .positive:
                print("+ ", terminator: "")
            }
        }
        print("")
    }
    printIntegerKinds([3, 19, -27, 0, -6, 0, 7]) // + + - 0 - 0 + 
}
