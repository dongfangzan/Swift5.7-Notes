//
//  ControlFlow.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 31.10.22.
//

import Foundation

func controlFlow() {
    func forIn() {
        let names = ["Anna", "Ales", "Brina", "Jack"]
        for name in names {
            print("Hello, \(name)")
        }
        // Hello, Anna!
        // Hello, Alex!
        // Hello, Brian!
        // Hello, Jack!
        
        let numberOfLegs = ["spider":8, "ant":6, "cat":4]
        for (animalName, legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        // cats have 4 legs
        // ants have 6 legs
        // spiders have 8 legs
        
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        // 1 times 5 is 5
        // 2 times 5 is 10
        // 3 times 5 is 15
        // 4 times 5 is 20
        // 5 times 5 is 25
        
        let base = 3
        let power = 10
        var answer = 1
        for _ in 1...power {
            answer *= base
        }
        print("\(base) to the power of \(power) is \(answer)") // 3 to the power of 10 is 59049
        
        let minutes = 60
        for tickMark in 0..<minutes {
            // 每分钟渲染一个刻度线（60次）
            print(tickMark)
        }
        
        let minuteInterval = 5
        for tickMark in stride(from: 0, to: minutes, by: 5) {
            // 每5分钟渲染一个刻度线（0, 5, 10, 15 ... 45, 50, 55）
            print(tickMark)
        }
        
        let hours = 12
        let hourInterval = 3
        for tickMark in stride(from: 3, through: hours, by: hourInterval) {
            // 每3小时渲染一个刻度线（3, 6, 9, 12）
            print(tickMark)
        }
    }
    forIn()
    
    
    func whileLoops() {
        func game() {
            let finalSquare = 25
            var board = [Int](repeating: 0, count: finalSquare + 1)
            board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
            board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
            
            var square = 0
            var diceRoll = 0
            while square < finalSquare {
                // 掷骰子
                diceRoll += 1
                if diceRoll == 7 { diceRoll = 1 }
                // 根据点数移动
                square += diceRoll
                if square < board.count {
                    // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
                    square += board[square]
                }
            }
            print("Game over!")
        }
        game()
        
        func repeatGame() {
            let finalSquare = 25
            var board = [Int](repeating: 0, count: finalSquare + 1)
            board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
            board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
            var square = 0
            var diceRoll = 0
            repeat {
                // 顺着梯子爬上去或者顺着蛇滑下去
                square += board[square]
                // 掷骰子
                diceRoll += 1
                if diceRoll == 7 { diceRoll = 1 }
                // 根据点数移动
                square += diceRoll
            } while square < finalSquare
            print("Game over!")
        }
        repeatGame()
    }
    whileLoops()
    
    func conditionalStatement() {
        var temperatureInFahrenheit = 30
        if temperatureInFahrenheit <= 32 {
            print("It's very cold. Consider wearing a scarf.") // It's very cold. Consider wearing a scarf.
        }
        
        temperatureInFahrenheit = 40
        if temperatureInFahrenheit <= 32 {
            print("It's very cold. Consider wearing a scarf.")
        } else {
            print("It's not that cold. Wear a t-shirt.") // It's not that cold. Wear a t-shirt.
        }
        
        temperatureInFahrenheit = 90
        if temperatureInFahrenheit <= 32 {
            print("It's very cold. Consider wearing a scarf.")
        } else if temperatureInFahrenheit >= 86 {
            print("It's really warm. Don't forget to wear sunscreen.") // It's really warm. Don't forget to wear sunscreen.
        } else {
            print("It's not that cold. Wear a t-shirt.")
        }
        
        temperatureInFahrenheit = 72
        if temperatureInFahrenheit <= 32 {
            print("It's very cold. Consider wearing a scarf.")
        } else if temperatureInFahrenheit >= 86 {
            print("It's really warm. Don't forget to wear sunscreen.")
        }
        
        var someCharacter: Character = "z"
        switch someCharacter {
        case "a":
            print("The first letter of the alphabet")
        case "z":
            print("The last letter of the alphabet") // The last letter of the alphabet
        default:
            print("Some other character")
        }
        
//        let anotherCharacter: Character = "a"
//        switch anotherCharacter {
//        case "a": // 无效，这个分支下面没有语句
//        case "A":
//            print("The letter A")
//        default:
//            print("Not the letter A")
//        }
        let anotherCharacter: Character = "a"
        switch anotherCharacter {
        case "a", "A":
            print("The letter A") // The letter A
        default:
            print("Not the letter A")
        }
        
        let approximateCount = 62
        let countedThings = "moons orbiting Saturn"
        let naturalCount: String
        switch approximateCount {
        case 0:
            naturalCount = "no"
        case 1..<5:
            naturalCount = "a few"
        case 5..<12:
            naturalCount = "several"
        case 12..<100:
            naturalCount = "dozens of"
        case 100..<1000:
            naturalCount = "hundreds of"
        default:
            naturalCount = "many"
        }
        print("There are \(naturalCount) \(countedThings).") // There are dozens of moons orbiting Saturn.
        
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("\(somePoint) is at the origin")
        case (_, 0):
            print("\(somePoint) is on the x-axis")
        case (0, _):
            print("\(somePoint) is on the y-axis")
        case (-2...2, -2...2):
            print("\(somePoint) is inside the box") // (1, 1) is inside the box
        default:
            print("\(somePoint) is outside of the box")
        }
        
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)") // on the x-axis with an x value of 2
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")  // (1, -1) is on the line x == -y
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        
        someCharacter = "e"
        switch someCharacter {
        case "a", "e", "i", "o", "u":
            print("\(someCharacter) is a vowel") // e is a vowel
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            print("\(someCharacter) is a consonant")
        default:
            print("\(someCharacter) is not a vowel or a consonant")
        }
        
        let stillAnotherPoint = (9, 0)
        switch stillAnotherPoint {
        case (let distance, 0), (0, let distance):
            print("On an axis, \(distance) from the origin") // On an axis, 9 from the origin
        default:
            print("Not on an axis")
        }
    }
    conditionalStatement()
    
    func controlTransfer() {
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        for character in puzzleInput {
            switch character {
            case "a", "e", "i", "o", "u", " ":
                continue
            default:
                puzzleOutput.append(character)
            }
        }
        print(puzzleOutput) // grtmndsthnklk
        
        let numberSymbol: Character = "三"  // 简体中文里的数字 3
        var possibleIntegerValue: Int?
        switch numberSymbol {
        case "1", "١", "一", "๑":
            possibleIntegerValue = 1
        case "2", "٢", "二", "๒":
            possibleIntegerValue = 2
        case "3", "٣", "三", "๓":
            possibleIntegerValue = 3
        case "4", "٤", "四", "๔":
            possibleIntegerValue = 4
        default:
            break
        }
        if let integerValue = possibleIntegerValue {
            print("The integer value of \(numberSymbol) is \(integerValue).") // The integer value of 三 is 3.
        } else {
            print("An integer value could not be found for \(numberSymbol).")
        }
        
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            // fallthrough 关键字不会检查它下一个将会落入执行的 case 中的匹配条件。fallthrough 简单地使代码继续连接到下一个 case 中的代码，这和 C 语言标准中的 switch 语句特性是一样的。
            fallthrough
        default:
            description += " an integer."
        }
        print(description) // The number 5 is a prime number, and also an integer.
        
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        
        gameLoop: while square != finalSquare {
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            switch square + diceRoll {
            case finalSquare:
                // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
                continue gameLoop
            default:
                // 合法移动，做正常的处理
                square += diceRoll
                square += board[square]
            }
        }
        print("Game over!")
        
        func greet(person: [String: String]) {
            // guard与if类似，但guard语句必须有一个else从句
            guard let name = person["name"] else {
                return
            }
            print("Hello \(name)!")
            
            guard let location = person["location"] else {
                print("I hope the weather is nice near you.")
                return
            }
            print("I hope the weather is nice in \(location)")
        }
        
        greet(person: ["name":"John"])
        // 输出“Hello John!”
        // 输出“I hope the weather is nice near you.”
        greet(person: ["name":"Jane", "location":"Cupertino"])
        // 输出“Hello Jane!”
        // 输出“I hope the weather is nice in Cupertino.”
    }
    controlTransfer()
    
    // 检测API可用性
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/05_control_flow#checking-api-availability
    func checkingApiAvailabality() {
        if #available(iOS 10, macOS 10.12, *) {
            // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
        } else {
            // 使用先前版本的 iOS 和 macOS 的 API
        }
        
        @available(macOS 10.12, *)
        struct ColorPreference {
            var bestColor = "blue"
        }
        
        func chooseBestColor() -> String {
            guard #available(macOS 10.12, *) else {
                return "gray"
            }
            let colors = ColorPreference()
            return colors.bestColor
        }
        
        print(chooseBestColor()) // blue
    }
    checkingApiAvailabality()
}
