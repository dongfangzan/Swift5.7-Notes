//
//  StringsAndCharacters.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 28.10.22.
//

import Foundation

func stringsAndCharacters() {
    
    
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
    
    // 初始化
    var emptyString = ""              // 空字符串
    var anotherEmptyString = String() // 初始化方法
    
    if emptyString.isEmpty {
        print("Nothing to see here") // 打印输出 Nothing to see here
    }
    
    var variableString = "Horse"
    variableString += " and carriage"
    // variableString 为 "Horse and carriage"
    
    let constantString = "Highlander"
//    constantString += " and another Highlander" 常量字符串不可以修改
    
    for character in "Dog!🐶" {
        print(character)
    }
    
    let exclamationMark: Character = "!"
    
    let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
    let catString = String(catCharacters)
    print(catString)
    
    // 字符串连接
    let string1 = "hello"
    let string2 = " there"
    var welcome = string1 + string2
    print(welcome) // hello there
    
    var instruction = "look over"
    instruction += string2
    print(instruction) // look over there
    
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
    
    // 字符串插值
    let multiplier = 3
    let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
    // message 是 "3 times 2.5 is 7.5"
    // 下面用#扩展字符串，不处理字符串插值等特殊符号
    print(#"Write an interpolated string in Swift using \(multiplier)."#)
    // 打印 "Write an interpolated string in Swift using \(multiplier)."
    
    // 反扩展
    print(#"6 times 7 is \#(6 * 7)."#)
    // 打印 "6 times 7 is 42."
    
    // unicode
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
    
    // 计算字符数量
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



