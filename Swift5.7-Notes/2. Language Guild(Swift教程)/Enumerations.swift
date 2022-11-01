//
//  Enumerations.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 31.10.22.
//

import Foundation

func enumerations() {
    
    enum SomeEnumeration {
        // 枚举定义放在这里
    }
    
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    // 多个成员值可以出现在同一行上，用逗号隔开
    enum Planet {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    // 直接推断为CompassPoint类型
    var directionToHead = CompassPoint.west
    // 直接修改时可以省略类型名
    directionToHead = .east
    
    directionToHead = .south
    switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins") // Watch out for penguins
    case .east:
        print("Where the sun rises")
    case .west:
        print("Where the skies are blue")
        
    }
    
    let somePlanet = Planet.earth
    switch somePlanet {
    case .earth:
        print("Mostly harmless") // Mostly harmless
    default:
        print("Not a safe place for humans")
    }
    
    enum Beverage: CaseIterable {
        case coffee, tea, juice
    }
    let numberOfChoices = Beverage.allCases.count
    print("\(numberOfChoices) beverages available") // 3 beverages available
    
    for beverage in Beverage.allCases {
        print(beverage)
    }
    // coffee
    // tea
    // juice
    
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    var productBarcode = Barcode.upc(8, 85909, 51226, 3)
    productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
    switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode)")
    }
    
    enum ASCIIControlCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    
    func rawValues() {
        enum Planet: Int {
            // Plant.mercury 的显式原始值为 1，Planet.venus 的隐式原始值为 2，依次类推。
            case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        
        enum CompassPoint: String {
            case north, south, east, west
        }
        
        print(Planet.earth.rawValue) // 3
        print(CompassPoint.west.rawValue) // west
        
        let possiblePlanet = Planet(rawValue: 7)
        // 类型为Planet? 值为Planet.uranus
        print(possiblePlanet!)
        
        let positionToFind = 11
        if let somePlanet = Planet(rawValue: positionToFind) {
            switch somePlanet {
            case.earth:
                print("Mostly harmless")
            default:
                print("Not a safe place for humans")
            }
        } else {
            print("There isn't a planet at position \(positionToFind)")  // There isn't a planet at position 11
        }
    }
    rawValues()
    
    // 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上 indirect 来表示该成员可递归。
    func recursiveEnumerations() {
        enum ArithmeticExpression {
            case number(Int)
            indirect case addition(ArithmeticExpression, ArithmeticExpression)
            indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
        }
        
        // 两种方式都可以
//        indirect enum ArithmeticExpression {
//            case number(Int)
//            indirect case addition(ArithmeticExpression, ArithmeticExpression)
//            indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//        }
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
        
        func evaluate(_ expression: ArithmeticExpression) -> Int {
            switch expression {
            case .number(let int):
                return int
            case .addition(let arithmeticExpression, let arithmeticExpression2):
                return evaluate(arithmeticExpression) + evaluate(arithmeticExpression2)
            case .multiplication(let arithmeticExpression, let arithmeticExpression2):
                return evaluate(arithmeticExpression) * evaluate(arithmeticExpression2)
            }
        }
        
        print(evaluate(product))
    }
    recursiveEnumerations()
}
