//
//  Protocols.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 7.11.22.
//

import Foundation

private protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

private protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

private protocol FullyNamed {
    var fullName: String { get }
}

private protocol RandomNumberGenerator {
    func random() -> Double
}

// 异变方法
private protocol Togglable {
    // 增加mutating关键字，class中可以不加
    mutating func toggle()
}

protocol SomeProtocol1 {
    init()
}

class SomeSuperClass {
    init() {
        // 这里是构造器的实现部分
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol1 {
    // 因为遵循协议，需要加上 required
    // 因为继承自父类，需要加上 override
    required override init() {
        // 这里是构造器的实现部分
    }
}

private class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

private protocol DiceGame {
    var dice: Dice { get }
    func play()
}

private protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

private protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

private class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

private class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

private class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

// 有条件的遵循协议
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

private struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

private struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

extension Hamster: TextRepresentable {}

private protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

private protocol Named {
    var name: String { get }
}

private protocol Aged {
    var age: Int { get }
}

private struct Person2: Named, Aged {
    var name: String
    var age: Int
}

private class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

private class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

private protocol HasArea {
    var area: Double { get }
}

private class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
private class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

private class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

// 用在需要和Objective-c打交道的代码中，需要带上@objc属性
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

private class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

private class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement: Int = 3
}

private class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}


extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

func protocols() {
    struct Person: FullyNamed {
        var fullName: String
    }
    
    let john = Person(fullName: "John Appleseed")
    print(john.fullName) // John Appleseed
    
    class Starship: FullyNamed {
        var prefix: String?
        var name: String
        init(name: String, prefix: String? = nil) {
            self.prefix = prefix
            self.name = name
        }
        var fullName: String {
            return (prefix != nil ? prefix! + " " : "") + name
        }
    }
    
    var ncc1701 = Starship(name: "Enterprise", prefix: "USS") // USS Enterprise
    print(ncc1701.fullName)
    
    
    
    let generator = LinearCongruentialGenerator()
    print("Here's a random number: \(generator.random())") // Here's a random number: 0.3746499199817101
    print("And another one: \(generator.random())") // And another one: 0.729023776863283
    
    enum OnOffSwitch: Togglable {
        case off, on
        mutating func toggle() {
            switch self {
            case .off:
                self = .on
            case .on:
                self = .off
            }
        }
    }
    
    var lightSwitch = OnOffSwitch.off
    lightSwitch.toggle()
    print(lightSwitch) // on
    
    
    var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
    for _ in 1...5 {
        print("Random dice roll is \(d6.roll())")
    }
    // Random dice roll is 3
    // Random dice roll is 5
    // Random dice roll is 4
    // Random dice roll is 5
    // Random dice roll is 4
    
    
    let tracker = DiceGameTracker()
    let game = SnakesAndLadders()
    game.delegate = tracker
    game.play()
    // Started a new game of Snakes and Ladders
    // The game is using a 6-sided dice
    // Rolled a 3
    // Rolled a 5
    // Rolled a 4
    // Rolled a 5
    // The game lasted for 4 turns
    
    let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
    print(d12.textualDescription)
    
    print(game.textualDescription) // A game of Snakes and Ladders with 25 squares
    
    let myDice = [d6, d12]
    print(myDice.textualDescription) // [A 6-sided dice, A 12-sided dice]
    
    let simonTheHamster = Hamster(name: "Simon")
    let somethingTextRepresentable: TextRepresentable = simonTheHamster
    print(somethingTextRepresentable.textualDescription) // A hamster named Simon
    
    let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
    let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
    if twoThreeFour == anotherTwoThreeFour {
        print("These two vectors are also equivalent.") // These two vectors are also equivalent.
    }
    
    enum SkillLevel: Comparable {
        case beginner
        case intermediate
        case expert(stars: Int)
    }
    
    var levels = [SkillLevel.intermediate, SkillLevel.beginner, SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
    for level in levels.sorted() {
        print(level)
    }
    // 打印 "beginner"
    // 打印 "intermediate"
    // 打印 "expert(stars: 3)"
    // 打印 "expert(stars: 5)"
    
    let things: [TextRepresentable] = [game, d12, simonTheHamster]
    for thing in things {
        print(thing.textualDescription)
    }
    // A game of Snakes and Ladders with 25 squares
    // A 12-sided dice
    // A hamster named Simon
    
    print(game.prettyTextualDescription)
    // A game of Snakes and Ladders with 25 squares:
    // ○ ○ ▲ ○ ○ ▲ ○ ○ ▲ ▲ ○ ○ ○ ▼ ○ ○ ○ ○ ▼ ○ ○ ▼ ○ ▼ ○
    func wishHappyBirthday(to celebrator: Named & Aged) {
        print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
    }
    
    let birthdayPerson = Person2(name: "Malcolm", age: 21)
    wishHappyBirthday(to: birthdayPerson)
    
    func beginConcert(in location: Location & Named) {
        print("Hello, \(location.name)!")
    }
     
    let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
    beginConcert(in: seattle)
    
    let objects: [AnyObject] = [
        Circle(radius: 2.0),
        Country(area: 243_610),
        Animal(legs: 4)
    ]
    
    for object in objects {
        if let objectWithArea = object as? HasArea {
            print("Area is \(objectWithArea.area)")
        } else {
            print("Something that doesn't have an area")
        }
    }
    // Area is 12.5663708
    // Area is 243610.0
    // Something that doesn't have an area
    
    var counter = Counter()
    counter.dataSource = ThreeSource()
    for _ in 1...4 {
        counter.increment()
        print(counter.count)
    }
    // 3
    // 6
    // 9
    // 12
    
    counter.count = -4
    counter.dataSource = TowardsZeroSource()
    for _ in 1...5 {
        counter.increment()
        print(counter.count)
    }
    // -3
    // -2
    // -1
    // 0
    // 0
    
    print("Here's a random number: \(generator.random())") // Here's a random number: 0.6364669067215364
    print("And here's a random Boolean: \(generator.randomBool())") // And here's a random Boolean: true
    
    let equalNumbers = [100, 100, 100, 100, 100]
    let differentNumbers = [100, 100, 200, 100, 200]
    print(equalNumbers.allEqual()) // true
    print(differentNumbers.allEqual()) // false
}
