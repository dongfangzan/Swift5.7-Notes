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
        
        letters.insert("a")
        print(letters) // ["a"]
        letters = []
        print(letters) // 还是Set类型
        
        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//        var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]  简化版本
        print(favoriteGenres) // ["Rock", "Classical", "Hip hop"]
        
        print("I have \(favoriteGenres.count) favorite music genres.")
        
        if favoriteGenres.isEmpty {
            print("As far as music goes, I'm not picky.")
        } else {
            print("I have particular music preferences.") //I have particular music preferences.
        }
        
        favoriteGenres.insert("Jazz") // 第四个元素
        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.") // Rock? I'mt over it.
        } else {
            print("I never much cared for that.")
        }
        
        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.")
        } else {
            print("It's too funky in there.") // It's too funky in there.
        }
        
        for genre in favoriteGenres {
            print("\(genre)")
        }
        
        let oddDigits: Set = [1,3,5,7,9]
        let evenDigits: Set = [0,2,4,6,8]
        let singleDigitPrimeNumbers: Set = [2,3,5,7]
        print(oddDigits.union(evenDigits).sorted()) // 并集 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        print(oddDigits.intersection(evenDigits).sorted()) // 交集 []
        print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted()) // 补集 [1, 9]
        print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()) // 对称差分 [1, 2, 9]
        
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]

        print(houseAnimals.isSubset(of: farmAnimals)) // true
        print(farmAnimals.isSuperset(of: houseAnimals)) // true
        print(farmAnimals.isDisjoint(with: cityAnimals)) // true
    }
    sets()
    
    // Dictionary/字典
    // https://swiftgg.gitbook.io/swift/swift-jiao-cheng/04_collection_types#dictionaries
    func dicts() {
        var namesOfIntegers: [Int: String] = [:]
        // namesOfIntegers 是一个空的 [Int: String] 字典
        
        namesOfIntegers[16] = "sixteen"
        // namesOfIntegers 现在包含一个键值对
        print(namesOfIntegers) // [16: "sixteen"]
        namesOfIntegers = [:]
        // namesOfIntegers 又成为了一个 [Int: String] 类型的空字典
        
        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"] // ["DUB": "Dublin", "YYZ": "Toronto Pearson"]
        // var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"] 简易写法
        print(airports)
        
        print("The dictionary of airports contains \(airports.count) items.") // The dictionary of airports contains 2 items.
        airports["LHR"] = "London"
        print(airports) // ["YYZ": "Toronto Pearson", "LHR": "London", "DUB": "Dublin"]
        
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue)") // The old value for DUB was Dublin
        }
        
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName).") // The name of the airport is Dublin Airport.
        } else {
            print("The airport is not in the airports dictionary.")
        }
        
        airports["APL"] = "Apple Internation"
        print(airports) // ["YYZ": "Toronto Pearson", "DUB": "Dublin Airport", "APL": "Apple Internation", "LHR": "London"]
        airports["APL"] = nil // 移除APL
        print(airports) // ["DUB": "Dublin Airport", "YYZ": "Toronto Pearson", "LHR": "London"]
        
        if let removedValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        // YYZ: Toronto Pearson
        // LHR: London Heathrow
        
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        // Airport code: YYZ
        // Airport code: LHR

        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        // Airport name: Toronto Pearson
        // Airport name: London Heathrow
        
        let airportCodes = airports.keys
        // 文档写法let airportCodes = [String](airports.keys)，但是不写[String]貌似也行？
        print(airportCodes) // ["LHR", "YYZ"]
        
        let airportNames = airports.values
        print(airportNames)
    }
    dicts()
}
