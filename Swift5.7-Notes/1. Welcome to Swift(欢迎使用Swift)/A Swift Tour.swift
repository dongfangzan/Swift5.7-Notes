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
    // https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/03_a_swift_tour#simple-values
    simpleValues()

    // ## Control Flow/控制流
    // https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/03_a_swift_tour#control-flow
    controlFLow()

    // ## functions and closures/函数和闭包
    // https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/03_a_swift_tour#functions-and-closures
    funcAndClosure()

    // ## object and class/对象和类
    // https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/03_a_swift_tour#objects-and-classes
    objectAndClass()

    // ## Enumerations and Structures/枚举和结构体
    // https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/03_a_swift_tour#enumerations-and-structure
    enumAndStruct()

    // ## Concurrency/并发性
    // https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/03_a_swift_tour#concurrency
    concurrency()
    
    // ## protocol and extesion/协议和扩展
    // https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/03_a_swift_tour#protocols-and-extensions
    protocolAndExtension()
    
    // ## Error Handling/错误处理
    // https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/03_a_swift_tour#error-handling
    errorHandling()
    
    // ## Generics/泛型
    // https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/03_a_swift_tour#generics
    generics()
}

// 1. Hello World
private func helloWolrd() {
    print("Hello, world!")
}

// 2. 简单值
private func simpleValues() {
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
private func controlFLow() {
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

private func greeting(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

private func greet(_ person: String, day: String) -> String {
    return "Hello \(person), today is \(day). No argument person."
}

// 返回一个闭包
private func calculateStatistics(scores:[Int]) -> (min: Int, max: Int, sum: Int) {
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
private func returnFifteen() -> Int{
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

// 函数式编程，可以把函数作为返回值，返回值为一个函数（入参为Int类型，出参为Int类型）
private func makeIncrement() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1+number
    }
    return addOne
}

// 函数作为参数，condtion参数接收一个函数（入参为Int，出参为Bool）
private func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

private func lessThanTen(number: Int) -> Bool {
    return number < 10
}

// functions and closures
private func funcAndClosure() {
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

private class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

private class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "\(name) with \(numberOfSides) sides."
    }
}

private class Square: NamedShape {
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

private class EquilateralTriangle: NamedShape {
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
private class TriangleAndSquare {
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
private func objectAndClass() {
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

private enum Rank: Int {
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

private enum Suit {
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

private enum ServerResponse {
    case result(String, String)
    case failure(String)
}

// 结构体，与类的最大区别在于，结构体传值，类传引用
private struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescritpion())"
    }
}

// 枚举和结构体
private func enumAndStruct() {
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

private func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

private func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}

private func connectUser(to server: String) async -> String {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
    return greeting
}

private func concurrency(){
    // 同步代码中调用异步函数且不等待返回结果，无输出
    Task {
        let result = await connectUser(to:"primary")
        print(result) // Hello Guest, user ID 97
    }
    
}

// 类似接口
private protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

private class SimpleClass: ExampleProtocol {
    // 无需增加mutating关键字
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
    
    var simpleDescription: String = "A very simple class"
    var anthoerProperty: Int = 69105
}

private struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    // 在结构体中需要增加mutating关键字，用来标记会修改结构体，因为结构体是不可变的  Left side of mutating operator isn't mutable: 'self' is immutable
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

// 扩展，为现有的类型添加功能
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
    
    
}

// 类、枚举和结构体都可以遵循协议
private func protocolAndExtension() {
    let a = SimpleClass()
    a.adjust()
    print(a.simpleDescription)
    
    var b = SimpleStructure()
    b.adjust()
    print(b.simpleDescription)
    
    print(7.simpleDescription)
    var c = 7
    // 教材补充：你不能直接用7.adjust()，因为7是一个常量，不能对一个常量进行修改
    c.adjust()
    print(c)
    
    // 可以使用其他命名类型一样使用协议名
    let protocolValue: ExampleProtocol = a
    print(protocolValue.simpleDescription)
}

// 使用`Error`协议来表示错误
private enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// 使用throw来跑出错误，使用throws来表示一个可以抛出错误的函数（同Java）
private func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    } else if printerName == "Fire in the hole" {
        throw PrinterError.onFire
    } else if printerName == "Out of Paper" {
        throw PrinterError.outOfPaper
    }
    return "Job sent"
}


private func errorHandling() {
    //do-catch 处理，使用try标记可以跑出错误的代码
    do {
        let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
        print(printerResponse)  // Job sent
    } catch {
        print(error)
    }
    
    // 可以写多个catch块，来处理不同的错误
    do {
        let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
        print(printerResponse)  // Job sent
    } catch PrinterError.onFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printerError as PrinterError {
        print("Printer error: \(printerError).") // Printer error: noToner.
    } catch {
        print(error)
    }
    
    // 未抛出异常，返回正常数据
    let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
    // 抛出了异常，返回nil
    let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

    print(printerSuccess as Any) //Optional("Job sent")
    print(printerFailure as Any) //nil
    
    var fridgeIsOpen = false
    let fridgeContent = ["milk", "eggs", "leftovers"]
    
    func fridgeContains(_ food: String) -> Bool {
        fridgeIsOpen = true
        defer {
            fridgeIsOpen = false
        }
        let result = fridgeContent.contains(food)
        return result
    }

    print(fridgeContains("banana")) // false
    // 返回false
    print(fridgeIsOpen) // false
}

private func generics() {
    // 基础泛型写法
    func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
        var result: [Item] = []
        
        for _ in 0..<numberOfTimes {
            result.append(item)
        }
        return result
    }
    
    print(makeArray(repeating: "knock", numberOfTimes: 4)) //["knock", "knock", "knock", "knock"]
    
    enum OptionalValue<Wrapped> {
        case none
        case some(Wrapped)
    }
    
    var possibleInteger: OptionalValue<Int> = .none
    print(possibleInteger)  // none
    possibleInteger = .some(100)
    print(possibleInteger)  //some(100)
    
    // 类型后面使用where来限制类型，限定Sequence的Element属性要相同(也就是类型要相同)
    func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
    }
    
    // 编译失败，Type of expression is ambiguous without more context
    // anyCommonElements([1,2,3], ["3"])
    print(anyCommonElements([1,2,3], [3])) // true
}
