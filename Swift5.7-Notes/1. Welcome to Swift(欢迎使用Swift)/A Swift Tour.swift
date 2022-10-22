//
//  A Swift Tour.swift
//  Learning-Swift5.7
//
//  Created by 东方赞 on 22.10.22.
//

import Foundation

func aSwiftTour() {
    // # A Swift Tour/Swift 初见
    // ## Hello World
    helloWolrd()

    // ## Simple Values/简单值
    simpleValues()

    // ## Control Flow/控制流
    controlFLow()

    // ## functions and closures/函数和闭包
    funcAndClosure()
    
    // ## object and class/对象和类
    objectAndClass()
    
    // ## Enumerations and Structures/枚举和结构体
    enumAndStruct()
}

// 1. Hello World
func helloWolrd() {
    print("Hello, world!")
}

// 2. 简单值
func simpleValues() {
    // 声明变量
    var myVariable = 42
    myVariable = 50
    // 声明常量
    let myConstant = 42
    
    print("myVariable:\(myVariable), myConstant:\(myConstant)")
    
    // 赋值和类型转换
    let implicitInteger = 70
    let implicitDouble = 70.0
    let explicitDouble: Double = 70
    print("implicitInteger:\(implicitInteger), implicitDouble:\(implicitDouble), explicitDouble:\(explicitDouble)")
    
    let label = "The width is "
    let width = 94
    let widthLabel = label + String(width)
//    let widthLabel = label + width 编译报错
    print(widthLabel)
    
    // 字符串拼接
    let apples = 3
    let oranges = 5
    let appleSummary = "I have \(apples) apples."
    let fruitSummary = "I have \(apples+oranges) pieces of fruit."
    print(appleSummary)
    print(fruitSummary)
    
    let quotation = """
    I said "I have \(apples) + apples."
    And then I said "I have \(apples + oranges) pieces of fruit."
    """
    print(quotation)
    
    // 数组和字典
    var shoppingList = ["catfish", "water", "tulips", "blue paint"]
    print(shoppingList)
    shoppingList[1] = "bottle of water"
    print(shoppingList)
    
    var occupation = [
        "Malcolm": "Captain",
        "Kaylee": "Mechanic",
    ]
    
    occupation["Jayne"] = "Public Relations"
    print(occupation)
    
    shoppingList.append("blue paint")
    print(shoppingList)
    
    // 初始化
    // let emptyArray: [String] = []
    // let emtpyDictionary: [String: Float] = [:]
    
    // shoppingList = []
    // occupations = [:]
}

// Control Flow
func controlFLow() {
    let individualScores = [75, 43, 103, 87, 12]
    var teamScore = 0
    for score in individualScores {
        if score > 50 {
            teamScore += 3
        } else {
            teamScore += 1
        }
    }
    print("teamScore: \(teamScore)")
    
    // String?，其中问号表示可选的
    let optionalString: String? = "Hello"
    // var nonNilString: String = nil 编译报错，不能赋值给非?的变量
    print(optionalString == nil) // 返回false，如果把Hello改成nil返回true
    
    let optionalName: String? = "John Appleseed"
    // var optionalName: String? = nil // let name = optionalName 会返回false
    var greeting = "Hello!"
    // 这里有一个隐含判断optionalName是否为空的判断
    if let name = optionalName {
        greeting = "Hello, \(name)"
    }
    
    print(greeting)
    
    // ??的处理，??首先判断第一个变量，如果不为nil，返回第一个变量，否则返回第二个变量
//     let nickName: String? = nil
    let nickName: String? = "John"
    let fullName: String = "John Appleseed"
    let informalGreeting = "Hi \(nickName ?? fullName)"
    print(informalGreeting)
    
    // 判断nickName是否为空
    if let nickName {
        print("Hey, \(nickName)")
    }
    
    // switch
    let vegetable = "red pepper"
    switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    // 必须有default，否则编译报错`Switch must be exhaustive`
    default:
        print("Everything tastes good in soup.")
    }
    
    let interestingNumbers = [
        "Prime": [2, 3, 5, 7, 11, 13],
        "Fibonacci": [1, 1, 2, 3, 5, 8],
        "Square": [1, 4, 9, 16, 25],
    ]
    var largest = 0
    var largestType = ""
    // (_, numbers)，_可以表示忽略，
    for (type, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                largest = number
                largestType = type
            }
        }
    }
    
    print("largest number: \(largest), largest type: \(largestType)")
    
    // while
    var n = 2
    while n < 100 {
        n *= 2
    }
    print("n: \(n)")
    
    var m = 2
    // 相当于java的do
    repeat {
        m *= 2
    } while m < 100
    print("m: \(m)")
 
    var total = 0
    for i in 0..<4 {
        total += i
    }
    print("total(0..<4): \(total)")
}

func greeting(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

func greet(_ person: String, day: String) -> String {
    return "Hello \(person), today is \(day). No argument person."
}

// 返回一个闭包
func calculateStatistics(scores:[Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

// 嵌套函数
func returnFifteen() -> Int{
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

// 函数式编程，可以把函数作为返回值，返回值为一个函数（入参为Int类型，出参为Int类型）
func makeIncrement() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1+number
    }
    return addOne
}

// 函数作为参数，condtion参数接收一个函数（入参为Int，出参为Bool）
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

// functions and closures
func funcAndClosure() {
    // 参数名不能省略
    print(greeting(person: "Bob", day: "Tuesday"))
    print(greet("Bob", day: "Tuesday"))
    let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
    print("statistics:\(statistics)")
    print("return fifteen: \(returnFifteen())")
    
    let incrementFunc = makeIncrement()
    print("after make 7 increment: \(incrementFunc(7))")
    
    print(hasAnyMatches(list: [20, 19, 7, 12], condition: lessThanTen))
    print(hasAnyMatches(list: [20, 19, 17, 12], condition: lessThanTen))
    
    let numbers = [20, 19, 7, 12]
    let mappedNumbers = numbers.map({
        (number: Int) -> Int in
        let result = 3 * number
        return result
    })
    // 简单写法
    let mappedNumbersSimple = numbers.map({number in 3 * number})
    print("numbers:\(numbers)*3=\(mappedNumbers)")
    print("numbers:\(numbers)*3=\(mappedNumbersSimple)")
    
    let sortedNumbers = numbers.sorted { $0 > $1 }
    print(sortedNumbers)
}

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "\(name) with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "\(name) with sides of length \(sideLength)"
    }
}

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        // 1. 设置子类属性
        self.sideLength = sideLength
        // 2. 调用父类的构造器
        super.init(name: name)
        // 3. 改变父类定义的属性
        numberOfSides = 3
    }
    
    // getter和setter方法
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

// WillSet和didSet的用法
// willSet在设置一个新值之前调用代码，didSet在设置一个新值之后调用代码
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

// 对象和类
func objectAndClass() {
    // 实例化
    let shape = Shape()
    shape.numberOfSides = 7
    let shapeDescription = shape.simpleDescription()
    print(shapeDescription)
    
    let namedShape = NamedShape(name: "NamedShape")
    namedShape.numberOfSides = 5
    print(namedShape.simpleDescription())
    
    let square = Square(sideLength: 5.2, name: "my test square")
    print("square area: \(square.area())")
    print(square.simpleDescription())
    
    let triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
    print(triangle.perimeter)
    triangle.perimeter = 9.9
    print(triangle.sideLength)
    
    let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
    print(triangleAndSquare.square.sideLength)
    print(triangleAndSquare.triangle.sideLength)
    triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
    print(triangleAndSquare.triangle.sideLength)
    
    // 同前面?的用法
    let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
    _ = optionalSquare?.sideLength
}

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescritpion() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        // 类型已经是确定的了，所以不需要再写，只需直接.spades即可
        case .spades:
            return "black"
        case .clubs:
            return "black"
        case .hearts:
            return "red"
        case .diamonds:
            return "red"
        }
    }
}

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

// 结构体，与类的最大区别在于，结构体传值，类传引用
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescritpion())"
    }
}

// 枚举和结构体
func enumAndStruct() {
    let ace = Rank.ace
    let aceRawValue = ace.rawValue
    print(aceRawValue)
    
    if let convertedRank = Rank(rawValue: 3) {
        print(convertedRank.simpleDescription())
    }
    
    let hearts = Suit.hearts
    print(hearts.simpleDescritpion())
    print(hearts.color())
    
    let success = ServerResponse.result("6:00 am", "8:09 am")
    let failure = ServerResponse.failure("Out of cheese.")
    
    switch success {
    // 注意这里提取参数的方法
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
    case let .failure(message):
        print("Failure... \(message)")
    }
    
    let threeOfSpades = Card(rank: .three, suit: .spades)
}
