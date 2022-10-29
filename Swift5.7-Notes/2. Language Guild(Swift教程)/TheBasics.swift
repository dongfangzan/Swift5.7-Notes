//
//  TheBasics.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 24.10.22.
//

import Foundation

func theBasics() {
    // 包含C和Objective-C上所有基础数据类型
    // Int表示整型
    // Double和Float表示浮点型值
    // Bool表示布尔型值
    // String是文本型数据
    // Array、Set和Dictionary集合类型
    
    // Constants and Variables/变量和常量
    varAndConst()
    
    // Integers/整数
    integers()
    
    // Type Aliases/类型别名
    typeAliases()
    
    // Booleans/布尔值
    booleans()
    
    // Tuples/元组
    tuples()
    
    // Optionals/可选类型
    optionals()
    
    // Error Handling/错误处理
    basicsErrorHandling()
    
    // Assersions And Predictions/断言和先决条件
    assertionsAndPredictions()
}

// 变量和常量
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#constants-and-variables
private func varAndConst() {
    // 声明变量和常量
    // 常量
    let maxiumNumberOfLoginAttempts = 10
    // 变量
    var currentLoginAttempt = 0
    // 多个变量
    var x=0.0, y=0.0, z=0.0
    
    var welcomeMessage: String
    welcomeMessage = "Hello"
    
    var red,green,blue: Double
    
    // 用unicode编码的字符作为变量名
    let π = 3.14159
    let 你好="你好世界"
    let 🐶🐮="dogcow"
    
    // 变量可以改
    var friendlyWelcome = "Hello!"
    friendlyWelcome = "Bonjour!"
    
    let languageName = "Swift"
    // languageName = "Swift++" // 常量不能变，编译报错
    
    // 输出一个或多个值
    print(friendlyWelcome) // Bonjour!
    
    // 用\()表示占位符
    print("The current value of friendlyWelcome is \(friendlyWelcome)") //The current value of friendlyWelcome is Bonjour!
    
    // 单行注释
    /* 多行注释，这是第一行
      这是第二行注释 */
    
    /* 这是第一个多行注释的开头
     /* 这是第二个被嵌套的多行注释 */
    这是第一个多行注释的结尾 */
    
    // 你可以在一行中输入语句时使用;来分割
    let cat = "🐱"; print(cat) // 🐱
}

// Integers/整数
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#type-annotations
private func integers() {
    // minValue为0，是UInt8类型（8位无符号整型）
    let minValue = UInt8.min
    // maxValue为255，是UInt类型（8位无符号整型）
    let maxValue = UInt8.max
    
    /* 关于Int与UInt
        在32位平台上，Int和Uint等于Int32和UInt32
        在64位平台上，Int和Uint等于Int64和UInt64
        目前的iOS设备都是64位的 */
    
    // 浮点数
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#floating-point-numbers
    func floatingPointNumbers() {
        // 有小数部分的数字，如3.14159、0.1和-273.15
        // Double表示64位浮点数，至少15位小数，当你需要存储更大或精度更高的浮点数时使用此类型，优先使用此类型
        // Float表示32位浮点数，6位小数，精度要求不高可以使用此类型
    }

    // 类型安全和类型判断
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#type-safety-and-type-inference
    func typeSafetyAndTypeInference() {
        // meaningOfLife 会被推测为Int类型
        let meaningOfLife = 42
        
        // pi 会被推测为Double类型
        let pi = 3.14159
        
        // anotherPi会被推测为 Double 类型
        let anotherPi = 3 + 0.14159
    }
    
    // 数字型字面量
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#numeric-literals
    func numericLiterals() {
        let decimalInteger = 17
        let binaryInteger = 0b10001     // 二进制的17
        let octalInteger = 0o21         // 八进制的17
        let hexadecimalInteger = 0x11   // 十六进制的17
        
        // 都等于十进制的12.1875
        let decimalDouble = 12.1875
        let exponentDouble = 1.21875e1
        let hexadecimalDouble = 0xC.3p0
        
        // 增加额外的领和下划线来增强可读性，不影响数字
        let paddedDouble = 000123.456
        let oneMillion = 1_000_000
        let justOverOneMillion = 1_000_000.000_000_1
    }
    
    // Numeric Type Conversion/数值类型转换
    func numericTypeConversion() {
        // 编译错误，不能存储复数
//        let cannotbeNegative: Uint8 = -1
        // 编译错误，不能超过最大值
//        let tooBig: Int8 = Int8.max + 1
        
        let twoThousand: UInt16 = 2_000
        let one: UInt8 = 1
        let twoThousandAndOne = twoThousand + UInt16(one) // 转换为UInt16
        
        let three = 3
        let pointOneFourOneFiveNine = 0.14159
        let pi = Double(three) + pointOneFourOneFiveNine // 转换为Double类型
        
        let integerPi = Int(pi) //等于3，原则：截断小数部分，Int(4.75)=4 Int(-3.9)=-3
    }
}

// 别名
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#type-aliases
private func typeAliases() {
    typealias AudioSample = UInt16
    let maxAmplitudeFound = AudioSample.min // 0
}

// Booleans
private func booleans() {
    let orangesAreOrange = true
    let turnipsAreDelicious = false
    
    if turnipsAreDelicious {
        print("Mmm, tasty turnips!")
    } else {
        print("Eww, turnips are horrible.")
    }
    // 输出Eww, turnips are horrible.
    
    let i = 1
//    if i {
        // 编译不通过，非bool类型
//    }
    if i == 1 {
        // 编译成功
    }
}

// 把多个值组合成一个复合值，元组内的值可以是任意类型，并不要求相同
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#tuples
private func tuples() {
    let http404Error = (404, "Not Found")
    // 类型是(Int, String)，值是(404, "Not Found")
    let (statusCode, statusMessage) = http404Error
    print("The status code is \(statusCode)") // The status code is 404
    print("The status message is \(statusMessage)") // The status message is Not Found
    
    let (justTheStatusCode, _) = http404Error
    print("The status code is \(justTheStatusCode)") // The status code is 404
    
    print("The status code is \(http404Error.0)") // The status code is 404
    print("The status message is \(http404Error.1)") // The status message is Not Found
    
    // 单独命名
    let http200Status = (statusCode: 200, description: "OK")
    print("The status code is \(http200Status.statusCode)") // The status code is 200
    print("The status message is \(http200Status.description)") // The status message is OK
}

// 可选类型
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#optionals
private func optionals() {
    let possibleNumber = "123"
    // 被推测为"Int?"，或者类型为"optional Int"
    let convertedNumber = Int(possibleNumber)
    print(convertedNumber)
    
    // serverResponseCode
    var serverResponseCode: Int? = 404
    serverResponseCode = nil
    
    var surveyAnswer: String? //自动被设置为nil
    if convertedNumber != nil {
        // 输出“convertedNumber contains some integer value of 123.”
        print("convertedNumber contains some integer value of \(convertedNumber!).")
        // 强制解析convertedNumber!，表示取optional里面的值
        let unwrappedNumber = convertedNumber!
        print("unwrapped number:\(unwrappedNumber)")
    }
    
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#optional-binding
    if let actualNumber = Int(possibleNumber) {
        // 这里的actualNumber不再是optional，而是一个真实值，但Int(possibleNumber)是一个optional
        // 在这里叫做可选绑定(optional binding)
        // 表示如果某个optional存在，那么赋值给一个变量解析后的值
        // 如果某个optional不存在，那么该赋值语句返回false，不执行该分支
        print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
    } else {
        print("\'\(possibleNumber)\' could not be converted to an integer")
    }
    
    let myNumber = Int(possibleNumber)
    // 此处 myNumber 为一可选整型
    if let myNumber = myNumber {
        // 此处 myNumber 为一不可选整型
        print("My number is \(myNumber)")
    }
    // 输出 "My number is 123"
    
    // 简便写法
    if let myNumber {
        print("My number is \(myNumber)")
    }
    
    if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
        print("\(firstNumber) < \(secondNumber) < 100") // 4 < 42 < 100
    }
    
    if let firstNumber = Int("4") {
        if let secondNumber = Int("42") {
            print("\(firstNumber) < \(secondNumber) < 100") // 4 < 42 < 100
        }
    }
    
    let possibleString: String? = "An optional string."
    let forcedString: String = possibleString!
    
    // 这是一个optional,但是可以隐式解析
    let assumedString: String! = "An implicitly unwrapped optional string."
    let implicitString: String = assumedString  // 不需要加感叹号
    print(assumedString)
    
    // 可以当做普通可选类型判断是否包含值
    if assumedString != nil {
        print(assumedString!)
    }
    
    // 直接在绑定里写
    if let definiteString = assumedString {
        print(definiteString)
    }
}

private func basicsErrorHandling() {
    func canThrowAnError() throws {
        // 可能跑出错误
    }
    
    do {
        try canThrowAnError()
        // 没有错误抛出
    } catch {
        // 有错误抛出
    }
    
    enum SanwichError: Error {
        case outOfCleanDishes
        case missingIngrediens(ingredients: String)
    }
    
    func makeASanwich() throws {
        // ...
    }
    
    func eatASanwich() {
        // 无需抛出异常
    }
    
    func washDishes() {
        
    }
    
    func buyGroceries(_ ingredients: String) {
        
    }
    
    do {
        try makeASanwich()
        eatASanwich()
    } catch SanwichError.outOfCleanDishes {
        washDishes()
    } catch SanwichError.missingIngrediens(let ingrediens) {
        buyGroceries(ingrediens)
    } catch {
        // 需要一个空catch块处理其他错误，否则会报以下异常
        // Errors thrown from here are not handled because the enclosing catch is not exhaustive
    }
    
    
}

// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#assertions-and-preconditions
private func assertionsAndPredictions() {
    let age = -3
//    assert(age >= 0, "A person's age cannot be less than zero") age < 0，断言触发
    if age > 10 {
        print("You can ride the roller-coaster or the ferris wheel")
    } else if age > 0 {
        print("You can ride the ferris wheel")
    } else {
//        assertionFailure("A persson's age can't be less than zero.") age < 0，断言触发
    }
    
    let index = -1
//    precondition(index > 0, "Index must be greater than zero.")
    // 区别：assert只在debug环境生效，precondition是debug和release都生效
}
