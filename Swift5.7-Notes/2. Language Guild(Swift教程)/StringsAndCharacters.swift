//
//  StringsAndCharacters.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 28.10.22.
//

import Foundation

// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters
func stringsAndCharacters() {
    
    // 字符串字面量
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#string-literals
    func stringLiterals() {
        // 单行字符串
        let someString = "Some string literal value"
        
        // 多行字符串
        let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
        print(quotation)
        
        // \是续行符号
        let softWrappedQuotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin, \
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."
        """
        print(softWrappedQuotation)
        
        let lineBreaks = """

        This string starts with a line break.
        It also ends with a line break.

        """
        print(lineBreaks)
        
        // 特殊字符
        let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
        // "Imagination is more important than knowledge" - Einstein
        print(wiseWords)
        
        let dollarSign = "\u{24}"
        let blackHeart = "\u{2665}"
        let sparklingHeart = "\u{1F496}"
        print("\(dollarSign), \(blackHeart), \(sparklingHeart)") // $, ♥, 💖
        
    //    let threeDoubleQuotes = """
    //    Escaping the first quote \"""
    //    Escaping all three quotes \"\"\"
    //    """
        
        let threeMoreDoubleQuotationMarks = #"""
        Here are three more double quotes: """
        """#
        print(threeMoreDoubleQuotationMarks)
    }
    stringLiterals()
    
    // 初始化
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#initializing-an-empty-string
    func initializaingAnEmptyString() {
        var emptyString = ""              // 空字符串
        var anotherEmptyString = String() // 初始化方法
        
        if emptyString.isEmpty {
            print("Nothing to see here") // 打印输出 Nothing to see here
        }
    }
    initializaingAnEmptyString()
    
    // 字符串可变性
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#string-mutability
    func stringMutability() {
        var variableString = "Horse"
        variableString += " and carriage"
        // variableString 为 "Horse and carriage"
        
        let constantString = "Highlander"
    //    constantString += " and another Highlander" 常量字符串不可以修改
    }
    stringMutability()
    
    // 使用字符串
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#working-with-characters
    func workingWithCharacters() {
        for character in "Dog!🐶" {
            print(character)
        }
        
        let exclamationMark: Character = "!"
        
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)
    }
    workingWithCharacters()
    
    // 字符串连接
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#concatenating-strings-and-characters
    func concatenatingStringsAndCharacters() {
        let string1 = "hello"
        let string2 = " there"
        var welcome = string1 + string2
        print(welcome) // hello there
        
        var instruction = "look over"
        instruction += string2
        print(instruction) // look over there
        
        let exclamationMark: Character = "!"
        welcome.append(exclamationMark)
        
        let badStart = """
        one
        two
        """
        let end = """
        three
        """
        print(badStart + end)
        // 打印两行:
        // one
        // twothree

        let goodStart = """
        one
        two

        """
        print(goodStart + end)
    }
    concatenatingStringsAndCharacters()
    
    // 字符串插值
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#string-interpolation
    func stringInterpolation() {
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        // message 是 "3 times 2.5 is 7.5"
        // 下面用#扩展字符串，不处理字符串插值等特殊符号
        print(#"Write an interpolated string in Swift using \(multiplier)."#)
        // 打印 "Write an interpolated string in Swift using \(multiplier)."
        
        // 反扩展
        print(#"6 times 7 is \#(6 * 7)."#)
        // 打印 "6 times 7 is 42."
    }
    
    // unicode
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#unicode
    func unicode() {
        let eAcute: Character = "\u{E9}"                         // é
        let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上
        // eAcute 是 é, combinedEAcute 是 é
        print("\(eAcute), \(combinedEAcute)")
        
        let precomposed: Character = "\u{D55C}"                  // 한
        let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
        // precomposed 是 한, decomposed 是 한
        print("\(precomposed), \(decomposed)")
        
        let enclosedEAcute: Character = "\u{E9}\u{20DD}"
        // enclosedEAcute 是 é⃝
        print("\(enclosedEAcute)")
        
        let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
        // regionalIndicatorForUS 是 🇺🇸
        print("\(regionalIndicatorForUS)")
    }
    
    unicode()
    
    // 计算字符数量
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#counting-characters
    func countingCharacters() {
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.count) characters")
        // 打印输出“unusualMenagerie has 40 characters”
        
        var word = "cafe"
        print("the number of characters in \(word) is \(word.count)")
        // 打印输出“the number of characters in cafe is 4”

        word += "\u{301}"    // 拼接一个重音，U+0301

        print("the number of characters in \(word) is \(word.count)")
        // 打印输出“the number of characters in café is 4”
    }
    countingCharacters()
    
    // 访问和修改字符串
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#accessing-and-modifying-a-string
    func accessAndModifyingAString() {
        let greeting = "Guten Tag!"
        print(greeting[greeting.startIndex]) // G
        print(greeting[greeting.index(before: greeting.endIndex)]) // !
        print(greeting[greeting.index(after: greeting.startIndex)]) // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        print(greeting[index]) // T
        
    //    greeting[greeting.endIndex] // error 数组越界
    //    greeting.index(after: greeting.endIndex) // error 数组越界
        // indices 属性会创建一个包含全部索引的范围（Range）
        for index in greeting.indices {
            print("\(greeting[index]) ", terminator: "")
        }
        print("")
        
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        print(welcome) // hello
        welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
        print(welcome) // hello there!
    }
    accessAndModifyingAString()
    
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#substrings
    func substrings() {
        let greeting = "Hello, world!"
        let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
        let beginning = greeting[..<index] // 不会创建新的空间，只是重用
        print(beginning) // Hello
        
        // 复制substring
        let newString = String(beginning)
        
    }
    substrings()
    
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#comparing-strings
    func comparingStrings() {
        let quotation = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        if quotation == sameQuotation {
            print("These two strings are considered equal")
        }
        
        // "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
        let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

        // "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
        let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

        if eAcuteQuestion == combinedEAcuteQuestion {
            print("These two strings are considered equal")
        }
        // 打印输出“These two strings are considered equal”
        
        let latinCapitalLetterA: Character = "\u{41}"

        let cyrillicCapitalLetterA: Character = "\u{0410}"

        if latinCapitalLetterA != cyrillicCapitalLetterA {
            print("These two characters are not equivalent")
        }
        // 打印“These two characters are not equivalent”
    }
    comparingStrings()
    
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#prefix-and-suffix-equality
    func prefixAndSufixEquality() {
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        
        var act1SceneCount = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1 ") {
                act1SceneCount += 1
            }
        }
        print("There are \(act1SceneCount) scenes in Act 1")
        // 打印输出“There are 5 scenes in Act 1”
        
        var mansionCount = 0
        var cellCount = 0
        for scene in romeoAndJuliet {
            if scene.hasSuffix("Capulet's mansion") {
                mansionCount += 1
            } else if scene.hasSuffix("Friar Lawrence's cell") {
                cellCount += 1
            }
        }
        print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
        // 打印输出“6 mansion scenes; 2 cell scenes”
    }
    prefixAndSufixEquality()
    
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#unicode-representations-of-strings
    func unicodeRepresentationsOfStrings() {
        let dogString = "Dog‼🐶"
        for codeUnit in dogString.utf8 {
            print("\(codeUnit) ", terminator: "")
        }
        print("")
        // 68 111 103 226 128 188 240 159 144 182
        
        for codeUnit in dogString.utf16 {
            print("\(codeUnit) ", terminator: "")
        }
        print("")
        // 68 111 103 8252 55357 56374
        for scalar in dogString.unicodeScalars {
            print("\(scalar.value) ", terminator: "")
        }
        print("")
        // 68 111 103 8252 128054
        
        for scalar in dogString.unicodeScalars {
            print("\(scalar) ")
        }
        // D
        // o
        // g
        // ‼
        // 🐶
    }
    unicodeRepresentationsOfStrings()
}



