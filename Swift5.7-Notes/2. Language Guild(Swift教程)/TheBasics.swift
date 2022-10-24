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
    
    // Floating-Point Numbers/浮点数
    floatingPointNumbers()
    
    // Type Safety and Type Inference/类型安全和类型推断
    typeSafetyAndTypeInference()
    
    // Numeric Literals/数值型字面量
    numericLiterals()
}

// 变量和常量
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#constants-and-variables
func varAndConst() {
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
func integers() {
    // minValue为0，是UInt8类型（8位无符号整型）
    let minValue = UInt8.min
    // maxValue为255，是UInt类型（8位无符号整型）
    let maxValue = UInt8.max
    
    /* 关于Int与UInt
        在32位平台上，Int和Uint等于Int32和UInt32
        在64位平台上，Int和Uint等于Int64和UInt64
        目前的iOS设备都是64位的 */
}

// 浮点数
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#floating-point-numbers
func floatingPointNumbers() {
    // 有小数部分的数字，如3.14159、0.1和-273.15
    // Double表示64位浮点数，至少15位小数，当你需要存储更大或精度更高的浮点数时使用此类型，优先使用此类型
    // Float表示32位浮点数，6位小数，精度要求不高可以使用此类型
    //
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
    
    let decimalDouble = 12.1875
}
