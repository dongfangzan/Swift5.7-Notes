//
//  ErrorHandling.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 5.11.22.
//

import Foundation

func errorHandling2() {
    enum VendingMachineError: Error {
        case invalidSelection // 选择无效
        case inssuficientFunds(coinsNeeded: Int) // 金额不足
        case outOfStock  // 缺货
    }
    
    struct Item {
        var price: Int
        var count: Int
    }
    
    class VendingMachine {
        var inventory = [
            "Candy Bar": Item(price: 12, count: 7),
            "Chips": Item(price: 10, count: 4),
            "Pretzels": Item(price: 7, count: 11)
        ]
        
        var coinsDeposited = 0
        func vend(itemNamed name: String) throws {
            guard let item = inventory[name] else {
                throw VendingMachineError.invalidSelection
            }
            
            guard item.count > 0 else {
                throw VendingMachineError.outOfStock
            }
            
            guard item.price <= coinsDeposited else {
                throw VendingMachineError.inssuficientFunds(coinsNeeded: item.price - coinsDeposited)
            }
            
            coinsDeposited -= item.price
            var newItem = item
            newItem.count -= 1
            inventory[name] = newItem
            print("Dispensing \(name)")
        }
    }
    
    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
    ]
    
    func buyFavoriteSnak(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }
    
    struct PurchasedSnack {
        let name: String
        init(name: String, vendingMachine: VendingMachine) throws {
            try vendingMachine.vend(itemNamed: name)
            self.name = name
        }
    }
    
    var vendingMachine = VendingMachine()
    vendingMachine.coinsDeposited = 8
    do {
        try buyFavoriteSnak(person: "Alice", vendingMachine: vendingMachine)
        print("Success! Yum.")
    } catch VendingMachineError.invalidSelection {
        print("Invalid Selection.")
    } catch VendingMachineError.outOfStock {
        print("Out of Stock.")
    } catch VendingMachineError.inssuficientFunds(let coinsNeeded) {
        print("Insufficient funds, Please insert an additional \(coinsNeeded) coins.")  // Insufficient funds, Please insert an additional 2 coins.
    } catch {
        print("Unexpected error: \(error).")
    }
    
    func nourish(with item: String) throws {
        do {
            try vendingMachine.vend(itemNamed: item)
        } catch is VendingMachineError {
            print("Couldn't buy that from the vending machine.")
        }
    }
    
    do {
        try nourish(with: "Beet-Flavored Chips") // Couldn't buy that from the vending machine.
    } catch {
        print("Unexpected non-vending-machine-related error:\(error)")
    }
    
    func eat(item: String) throws {
        do {
            try vendingMachine.vend(itemNamed: item)
        } catch VendingMachineError.invalidSelection, VendingMachineError.inssuficientFunds, VendingMachineError.outOfStock {
            print("Invalid selection, out of stock, or not enough money.")
        }
    }
    
    // 简洁处理办法，try?
//    func someThrowingFunction() throws -> Int {
//        // ...
//    }
//
//    let x = try? someThrowingFunction()
//
//    let y: Int?
//    do {
//        y = try someThrowingFunction()
//    } catch {
//        y = nil
//    }
    
    // 如果抛出异常，会出现运行时错误
//    let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")

//    func processFile(filename: String) throws {
//        if exists(filename) {
//            let file = open(filename)
//            defer {
//                close(file)
//            }
//            while let line = try file.readline() {
//                // 处理文件。
//            }
//            // close(file) 会在这里被调用，即作用域的最后。
//        }
//    }
}
