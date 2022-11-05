//
//  Initialization.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 2.11.22.
//

import Foundation

func initialization() {
    
    struct Fahrenheit {
        var temperature: Double
        //        var temperature: Double = 32.0  // 另一种默认初始化方式
        init() {
            temperature = 32.0 // 默认值初始化
        }
    }
    
    var f = Fahrenheit()
    print("The default temperature is \(f.temperature)° Fahrenheit") // The default temperature is 32.0° Fahrenheit
    
    struct Celsius {
        var temperatureInCelsius: Double
        init(fromFahrenheit fahrenheit: Double) {
            temperatureInCelsius = (fahrenheit - 32.0) / 1.8
        }
        
        init(fromKelvin kelvin: Double) {
            temperatureInCelsius = kelvin - 273.15
        }
        // 不带实参label的构造器
        init(_ celsius: Double) {
            temperatureInCelsius = celsius
        }
    }
    
    let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
    print(boilingPointOfWater.temperatureInCelsius) // 100.0
    let freezingPointOfWater = Celsius(fromKelvin: 273.15)
    print(freezingPointOfWater.temperatureInCelsius) // 0.0
    
    struct Color {
        let red, green, blue: Double
        init(red: Double, green: Double, blue: Double) {
            self.red = red
            self.green = green
            self.blue = blue
        }
        init(white: Double) {
            red = white
            green = white
            blue = white
        }
    }
    
    let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
    let halfGray = Color(white: 0.5)
    print(magenta) // Color(red: 1.0, green: 0.0, blue: 1.0)
    print(halfGray) // Color(red: 0.5, green: 0.5, blue: 0.5)
    
    //    let veryGreen = Color(0.0,1.0,0.0) // 需要提供label，报错
    let bodyTemperature = Celsius(37.0)
    print(bodyTemperature.temperatureInCelsius) // 37.0
    
    class SurveyQuestion {
        let text: String // 可以用常量代替变量，表示题目不能更改
//        var text: String
        var response: String?
        init(text: String) {
            self.text = text
        }
        
        func ask() {
            print(text)
        }
    }
    
    let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
    cheeseQuestion.ask() // Do you like cheese?
    cheeseQuestion.response = "Yes, I do like cheese." // Yes, I do like cheese.
    
    class ShoppingListItem {
        var name: String?
        var quantity = 1
        var purchased = false
    }
    let item = ShoppingListItem()
    print("item name:\(item.name), quantity: \(item.quantity), purchased: \(item.purchased)") // item name:nil, quantity: 1, purchased: false
    
    struct Size {
        var width = 0.0, height = 0.0
    }
    let twoByTwo = Size(width: 2.0, height: 2.0)
    print(twoByTwo) // Size(width: 2.0, height: 2.0)
    let zeroByTwo = Size(height: 2.0)
    print(zeroByTwo) // Size(width: 0.0, height: 2.0)
    let zeroByZero = Size()
    print(zeroByZero) // Size(width: 0.0, height: 0.0)
    
    struct Point {
        var x = 0.0, y = 0.0
    }
    
    struct Rect {
        var origin = Point()
        var size = Size()
        
        init() {}
        
        init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        
        init(center: Point, size: Size) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.height / 2)
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }
    let basicRect = Rect()
    
    let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
    print(originRect)
    
    class Vehicle {
        var numberOfWheels = 0
        var description: String {
            return "\(numberOfWheels) wheel(s)"
        }
    }
    
    let vehicle = Vehicle()
    print("Vehicle: \(vehicle.description)")
    
    class Bicycle: Vehicle {
        override init() {
            super.init()
            numberOfWheels = 2
        }
    }
    
    let bicycle = Bicycle()
    print("Bicycle: \(bicycle.description)")
    
    class Hoverboard: Vehicle {
        var color: String
        init(color: String) {
            self.color = color
            // super.init() 这里被隐式调用
        }
        override var description: String {
            return "\(super.description) in a beautiful \(color)"
        }
    }
    
    let hoverboard = Hoverboard(color: "silver")
    print("Hoverboard: \(hoverboard.description)") // Hoverboard: 0 wheel(s) in a beautiful silver
    
    class Food {
        var name: String
        init(name: String) {
            self.name = name
        }
        
        convenience init() {
            self.init(name: "[Unnamed]")
        }
    }
    
    let namedMeat = Food(name: "Bacon")
    print(namedMeat.name) // Bacon
    let mysteryMeat = Food()
    print(mysteryMeat.name) // [Unnamed]
    
    class RecipeIngredient: Food {
        var quantity: Int
        init(name: String, quantity: Int) {
            self.quantity = quantity
            super.init(name: name)
        }
        
        override convenience init(name: String) {
            self.init(name: name, quantity: 1)
        }
    }
    
    let oneMysteryItem = RecipeIngredient()
    let oneBacon = RecipeIngredient(name: "Bacon")
    let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
    
    class ShoppingListItem2: RecipeIngredient {
        var purchased = false
        var description: String {
                var output = "\(quantity) x \(name)"
                output += purchased ? " ✔" : " ✘"
                return output
            }
    }
    
    var breakfastList = [
        ShoppingListItem2(),
        ShoppingListItem2(name: "Bacon"),
        ShoppingListItem2(name: "Eggs", quantity: 6)
    ]
    
    breakfastList[0].name = "Orange juice"
    breakfastList[0].purchased = true
    for item in breakfastList {
        print(item.description)
    }
    // 1 x orange juice ✔
    // 1 x bacon ✘
    // 6 x eggs ✘
    
    let wholeNumber: Double = 12345.0
    let pi = 3.14159
    
    if let valueMaintained = Int(exactly: wholeNumber) {
        print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)") // 12345.0 conversion to Int maintains value of 12345
    }
    
    let valueChanged = Int(exactly: pi)
    // valueChanged是Int?类型
    
    if valueChanged == nil {
        print("\(pi) conversion to Int does not maintain value") // 3.14159 conversion to Int does not maintain value
    }
    
    struct Animal {
        let species: String
        // 可失败的构造器
        init?(species: String) {
            if species.isEmpty {
                return nil
            }
            self.species = species
        }
    }
    
    let someCreature = Animal(species: "Giraffe")
    // someCreature的类型是Animal?而不是Animal
    
    if let giraffe = someCreature {
        print("An animal was initialized with a species of \(giraffe.species)")
    }
    
    let anonymousCreature = Animal(species: "")
    if anonymousCreature == nil {
        print("The anonymous creature could not be initialized") // The anonymous creature could not be initialized
    }
    
    enum TemperatureUnit {
        case Kelvin, Celsius, Fahrenheit
        init?(symbol: Character) {
            switch symbol {
            case "K":
                self = .Kelvin
            case "C":
                self = .Celsius
            case "F":
                self = .Fahrenheit
            default:
                return nil
            }
        }
    }
    
    let fahrenheitUnit = TemperatureUnit(symbol: "F")
    if fahrenheitUnit != nil {
        print("This is a defined temperature unit, so initialization succeeded.") // This is a defined temperature unit, so initialization succeeded.
    }
    
    let unknownUnit = TemperatureUnit(symbol: "X")
    if unknownUnit == nil {
        print("This is not a defined temperature unit, so initialization failed.") // This is not a defined temperature unit, so initialization failed.
    }
    
    class Product {
        let name: String
        init?(name: String) {
            if name.isEmpty { return nil }
            self.name = name
        }
    }
    
    class CarItem: Product {
        let quantity: Int
        init?(name: String, quantity: Int) {
            if quantity < 1 {
                return nil
            }
            self.quantity = quantity
            super.init(name: name)
        }
    }
    
    if let twoSocks = CarItem(name: "sock", quantity: 2) {
        print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)") // Item: sock, quantity: 2
    }
    
    if let zeroShirts = CarItem(name: "shirt", quantity: 0) {
        print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
    } else {
        print("Unable to initialize one unnamed product") // Unable to initialize one unnamed product
    }
    
    class Document {
        var name: String?
        init() {
            
        }
        init?(name: String) {
            if name.isEmpty { return nil}
            self.name = name
        }
    }
    
    class AutomaticallyNamedDocument: Document {
        override init() {
            super.init()
            self.name = "[Untitled]"
        }
        
        override init(name: String) {
            super.init()
            if name.isEmpty {
                self.name = "[Untitled]"
            } else {
                self.name = name
            }
        }
    }
    
    class UntitledDocument: Document {
        override init() {
            super.init(name: "[Untitled]")!
        }
    }
    
    class SomeClass {
        required init() {
            // 构造器的实现代码，要求子类的构造器前也要添加required修饰符
        }
    }
    
    class SomeSubclass: SomeClass {
        required init() {
            // 构造器的实现代码
        }
    }
    
    class SomeClass2 {
        let someProperty: String = {
            // 使用闭包添加默认值
            return ""
        } ()
    }
    
    struct Chessboard {
        let boardColors: [Bool] = {
            var temporaryBoard: [Bool] = []
            var isBlack = false
            for i in 1...8 {
                for j in 1...8 {
                    temporaryBoard.append(isBlack)
                    isBlack = !isBlack
                }
                isBlack = !isBlack
            }
            return temporaryBoard
        } ()
        
        func squareIsBlackAt(row: Int, column: Int) -> Bool {
            return boardColors[(row * 8) + column]
        }
    }
    
    let board = Chessboard()
    print(board.squareIsBlackAt(row: 0, column: 1)) // true
    print(board.squareIsBlackAt(row: 7, column: 7)) // false
}
