//
//  NestedTypes.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 7.11.22.
//

import Foundation

func nestedTypes() {
    struct BlackjackCard {

        // 嵌套的 Suit 枚举
        enum Suit: Character {
            case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
        }

        // 嵌套的 Rank 枚举
        enum Rank: Int {
            case two = 2, three, four, five, six, seven, eight, nine, ten
            case jack, queen, king, ace
            struct Values {
                let first: Int, second: Int?
            }
            var values: Values {
                switch self {
                case .ace:
                    return Values(first: 1, second: 11)
                case .jack, .queen, .king:
                    return Values(first: 10, second: nil)
                default:
                    return Values(first: self.rawValue, second: nil)
                }
            }
        }

        // BlackjackCard 的属性和方法
        let rank: Rank, suit: Suit
        var description: String {
            var output = "suit is \(suit.rawValue),"
            output += " value is \(rank.values.first)"
            if let second = rank.values.second {
                output += " or \(second)"
            }
            return output
        }
    }
    
    let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
    print("theAceOfSpades: \(theAceOfSpades.description)") // theAceOfSpades: suit is ♠, value is 1 or 11
    
    let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
    print(heartsSymbol) // ♡
}
