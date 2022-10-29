//
//  CollectionTypes.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 29.10.22.
//

import Foundation

func collectionTypes() {
    // arrays/数组
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/04_collection_types#arrays
    func arrays() {
        var someInts: [Int] = []
        print("someInts is of type [Int] with \(someInts.count) items") // someInts is of type [Int] with 0 items
        
        someInts.append(3)
        print(someInts) // [3]
        someInts = [] // 重新变为空数组
        
        var threeDoubles = Array(repeating: 0.0, count: 3)
        print(threeDoubles) // [0.0, 0.0, 0.0]
        // threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
        
        var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
        // anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]
        print(anotherThreeDoubles) // [2.5, 2.5, 2.5]

        var sixDoubles = threeDoubles + anotherThreeDoubles
        print(sixDoubles) // [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
        // sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
        
        var shoppingList: [String] = ["Eggs", "Milk"]
        // shoppingList 已经被构造并且拥有两个初始项。
        print(shoppingList) // ["Eggs", "Milk"]
//        var shoppingList = ["Eggs", "Milk"]  这种写法也可以
        
        print("The shopping list contains \(shoppingList.count) items.")
        // 输出“The shopping list contains 2 items.”（这个数组有2个项）
        
        if shoppingList.isEmpty {
            print("The shopping list is empty.")
        } else {
            print("The shopping list is not empty.") // 打印“The shopping list is not empty.”（shoppinglist 不是空的）
        }
        
        shoppingList.append("Flour")
        // shoppingList 现在有3个数据项，似乎有人在摊煎饼
        print(shoppingList) // ["Eggs", "Milk", "Flour"]
        
        shoppingList += ["Baking Powder"]
        // shoppingList 现在有四项了
        print(shoppingList) // ["Eggs", "Milk", "Flour", "Baking Powder"]
        
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        // shoppingList 现在有七项了
        print(shoppingList) // ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]
        
        var firstItem = shoppingList[0]
        // 第一项是“Eggs”
        print(firstItem)
        
        shoppingList[0] = "Six eggs"
        // 其中的第一项现在是“Six eggs”而不是“Eggs”
        print(shoppingList) // ["Six eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]
        
        shoppingList[4...6] = ["Bananas", "Apples"] // 会删掉一个，把最后三个替换成两个
        print(shoppingList) // ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]
        
        shoppingList.insert("Maple Syrup", at: 0) // 头部插入
        print(shoppingList) // ["Maple Syrup", "Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]
        
        shoppingList.remove(at: 0)
        print(shoppingList) // ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]
        
        firstItem = shoppingList[0]
        print(firstItem) // Six eggs
        
        shoppingList.removeLast() // 删除最后一个
        print(shoppingList) // ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas"]
        
        for item in shoppingList {
            print(item)
        }
        // Six eggs
        // Milk
        // Flour
        // Baking Powder
        // Bananas
        
        for (index, value) in shoppingList.enumerated() {
            print("Item \(String(index + 1)): \(value)")
        }
        // Item 1: Six eggs
        // Item 2: Milk
        // Item 3: Flour
        // Item 4: Baking Powder
        // Item 5: Bananas
    }
    arrays()
    
    // sets/集合
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/04_collection_types#sets
    func sets() {
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.") // letters is of type Set<Character> with 0 items.
    }
    sets()
}
