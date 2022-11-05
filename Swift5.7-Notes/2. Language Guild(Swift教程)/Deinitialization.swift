//
//  Deinitialization.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 5.11.22.
//

import Foundation

func deinitialization() {
    
    class Bank {
        static var coinsInBank = 10_000
        static func distribute(coins numberOfcoinsRequested: Int) -> Int {
            let numberOfCoinsToVend = min(numberOfcoinsRequested, coinsInBank)
            coinsInBank -= numberOfCoinsToVend
            return numberOfCoinsToVend
        }
        
        static func receive(coins: Int) {
            coinsInBank += coins
        }
    }
    
    class Player {
        var coinsInPurse: Int
        init(coins: Int) {
            coinsInPurse = Bank.distribute(coins: coins)
        }
        
        func win(coins: Int) {
            coinsInPurse += Bank.distribute(coins: coins)
        }
        
        deinit {
            Bank.receive(coins: coinsInPurse)
        }
    }
    
    var playerOne: Player? = Player(coins: 100)
    print("A new player has joined the game with \(playerOne!.coinsInPurse) coins") // A new player has joined the game with 100 coins
    print("There are now \(Bank.coinsInBank) coins left in the bank") // There are now 9900 coins left in the bank
    
    playerOne!.win(coins: 2_000)
    print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins") // PlayerOne won 2000 coins & now has 2100 coins
    print("The bank now only has \(Bank.coinsInBank) coins left") // The bank now only has 7900 coins left
    
    playerOne = nil
    print("PlayerOne has left the game") // PlayerOne has left the game
    // 析构之后，把硬币还了回去
    print("The bank has \(Bank.coinsInBank) coins") // The bank has 10000 coins
}
