//
//  Methods.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 1.11.22.
//

import Foundation

func methods() {
    func instanceMethod() {
        class Counter {
            var count = 0
            func increment() {
                count += 1
                // self.count += 1 相同写法
            }
            
            func increment(by amount: Int) {
                count += amount
            }
            
            func reset() {
                count = 0
            }
        }
        
        let counter = Counter()
        counter.increment()
        print(counter.count) // 1
        counter.increment(by: 5)
        print(counter.count) // 6
        counter.reset()
        print(counter.count) // 0
        
        struct Point {
            var x = 0.0, y = 0.0
            func isToTheRightOf(x: Double) -> Bool {
                return self.x > x
            }
            mutating func moveBy(x deltaX: Double, y deltaY: Double) {
                x += deltaX
                y += deltaY
//                self = Point(x: x + deltaX, y: y + deltaY) // 创建一个新的结构体实例
            }
        }
        
        var somePoint = Point(x: 4.0, y: 5.0)
        if somePoint.isToTheRightOf(x: 1.0) {
            print("This point is to the right of the line where x == 1.0")
        }
        
        somePoint.moveBy(x: 2.0, y: 3.0)
        print("The point is now at (\(somePoint.x), \(somePoint.y))") // The point is now at (6.0, 8.0)
        
        let fixedPoint = Point(x: 3.0, y: 3.0)
//        fixedPoint.moveBy(x: 2.0, y: 3.0) // 报错
        
        enum TriStateSwitch {
            case off, low, high
            mutating func next() {
                switch self {
                case .off:
                    self  = .low
                case .low:
                    self = .high
                case .high:
                    self = .off
                }
            }
        }
        
        var ovenLigh = TriStateSwitch.low
        ovenLigh.next()
        print(ovenLigh) // high
        ovenLigh.next()
        print(ovenLigh) // off
    }
    instanceMethod()
    
    func typeMethods() {
        class SomeClass {
            // 用static关键字也可以定义类型方法，但是用class关键字可以让子类继承
            class func someTypeMethod() {
                // 类型方法
            }
        }
        SomeClass.someTypeMethod()
        
        struct LevelTracker {
            static var highestUnlockedLevel = 1
            var currentLevel = 1
            static func unlock(_ level: Int) {
                if level > highestUnlockedLevel { highestUnlockedLevel = level }
            }
            
            static func isUnlocked(_ level: Int) -> Bool {
                return level <= highestUnlockedLevel
            }
            
            @discardableResult
            mutating func advance(to level: Int) -> Bool {
                if LevelTracker.isUnlocked(level) {
                    currentLevel = level
                    return true
                } else {
                    return false
                }
            }
        }
        
        class Player {
            var tracker = LevelTracker()
            let playerName: String
            func complete(level: Int) {
                LevelTracker.unlock(level + 1)
                tracker.advance(to: level + 1)
            }
            
            init(name: String) {
                playerName = name
            }
        }
        
        var player = Player(name: "Argyrios")
        player.complete(level: 1)
        print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)") //highest unlocked level is now 2
        
        player = Player(name: "Beto")
        if player.tracker.advance(to: 6) {
            print("player is now on level 6")
        } else {
            print("level 6 has not yet been unlocked") // level 6 has not yet been unlocked
        }
    }
    typeMethods()
}
