//
//  Properties.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 1.11.22.
//

import Foundation

func properties() {
    // 存储属性
    func storedProperties() {
        struct FixedLengthRange {
            var firstValue: Int
            let lenght: Int // 常量，初始化之后不能修改
        }
        
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, lenght: 3)
        rangeOfThreeItems.firstValue = 6
        
        // 报错：Cannot assign to property: 'rangeOfFourItems' is a 'let' constant
//        let rangeOfFourItems = FixedLengthRange(firstValue: 0, lenght: 4)
//        rangeOfFourItems.firstValue = 6
        
        class DataImporter {
            var fileName = "data.txt"
        }
        
        class DataManager {
            lazy var importer = DataImporter()
            var data: [String] = []
        }
        
        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        // 这里debug的话，可以看到importer属性是(DataImporter?)
        print(manager.importer.fileName) // data.txt
        // 在这里再次debug，可以看到importer属性已经有值了
        print("")
    }
    storedProperties()
    
    func computedProperties() {
        struct Point {
            var x = 0.0, y = 0.0
        }
        
        struct Size {
            var width = 0.0, height = 0.0
        }
        
        struct Rect {
            var origin = Point()
            var size = Size()
            var center: Point {
                get {
                    let centerX = origin.x + (size.width / 2)
                    let centerY = origin.y + (size.height / 2)
                    return Point(x: centerX, y: centerY)
                }
                set(newCenter) {
                    origin.x = newCenter.x - (size.width / 2)
                    origin.y = newCenter.y - (size.height / 2)
                }
            }
        }
        
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
        let initialSquareCenter = square.center
        print(initialSquareCenter) // Point(x: 5.0, y: 5.0)
        
        square.center = Point(x: 15.0, y: 15.0)
        print(square.origin) // Point(x: 10.0, y: 10.0)
        
        struct AlternativeRect {
            var origin = Point()
            var size = Size()
            var center: Point {
                get {
                    let centerX = origin.x + (size.width / 2)
                    let centerY = origin.y + (size.height / 2)
                    return Point(x: centerX, y: centerY)
                }
                // 简化setter，用newValue作为入参
                set {
                    origin.x = newValue.x - (size.width / 2)
                    origin.y = newValue.y - (size.height / 2)
                }
            }
        }
        
        struct CompactRect {
            var origin = Point()
            var size = Size()
            var center: Point {
                // 简化getter
                get {
                    Point(x: origin.x + (size.width / 2),
                          y: origin.y + (size.height / 2))
                }
                set {
                    origin.x = newValue.x - (size.width / 2)
                    origin.y = newValue.y - (size.height / 2)
                }
            }
        }
        
        struct Cuboid {
            var width = 0.0, height = 0.0, depth = 0.0
            // 只读属性，可以去掉get
            var volume: Double {
                return width * height * depth
            }
        }
        
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        print(fourByFiveByTwo.volume) // 40.0
    }
    computedProperties()
    
    func propertyObservers() {
        class StepCounter {
            var totalSteps: Int = 0 {
                // 值设置之前调用
                willSet(newTotalSteps) {
                    print("将 totalSteps 的值设置为 \(newTotalSteps)")
                }
                // 值设置之后调用
                didSet {
                    if totalSteps > oldValue {
                        print("增加了 \(totalSteps - oldValue) 步")
                    }
                }
            }
        }
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        // 将 totalSteps 的值设置为 200
        // 增加了 200 步
        stepCounter.totalSteps = 360
        // 将 totalSteps 的值设置为 360
        // 增加了 160 步
        stepCounter.totalSteps = 896
        // 将 totalSteps 的值设置为 896
        // 增加了 536 步
    }
    propertyObservers()
    
    // 属性包装器，代理模式
    func propertyWrappers() {
        @propertyWrapper
        struct TwelvelOrLess {
            private var number = 0
            var wrappedValue: Int {
                get { number }
                set { number = min(newValue, 12)}
            }
        }
        
        struct SmallRectangle {
            @TwelvelOrLess var height: Int
            @TwelvelOrLess var width: Int
        }
        
        var rectangle = SmallRectangle()
        print(rectangle.height) // 0
        
        rectangle.height = 10
        print(rectangle.height) // 10
        
        rectangle.height = 24
        print(rectangle.height) // 12
        
        @propertyWrapper
        struct SmallNumber {
            private var maximum: Int
            private var number: Int
            
            var wrappedValue: Int {
                get { number }
                set { number = min(newValue, maximum) }
            }
            
            init() {
                maximum = 12
                number = 0
            }
            
            init(wrappedValue: Int) {
                maximum = 12
                number = min(wrappedValue, maximum)
            }
            
            init(wrappedValue: Int, maximum: Int) {
                self.maximum = maximum
                number = min(wrappedValue, maximum)
            }
        }
        
        struct UnitRectangle {
            @SmallNumber var height: Int = 1
            @SmallNumber var width: Int = 1
        }
        
        var unitRectangle = UnitRectangle()
        print(unitRectangle.height, unitRectangle.width) // 1 1
        
        struct NarrowRectangle {
            @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
            @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
        }
        var narrowRectangle = NarrowRectangle()
        print(narrowRectangle.height, narrowRectangle.width) // 2 3
        narrowRectangle.height = 100
        narrowRectangle.width = 100
        print(narrowRectangle.height, narrowRectangle.width) // 5 4
        
        struct MixedRectangle {
            @SmallNumber var height: Int = 1
            @SmallNumber(maximum: 9) var width: Int = 2
        }
        
        var mixedRectangle = MixedRectangle()
        print(mixedRectangle.height) // 1
        
        mixedRectangle.height = 20
        print(mixedRectangle.height) // 12
        
        @propertyWrapper
        struct SmallNumber2 {
            private var number: Int
            private(set) var projectedValue: Bool
            
            var wrappedValue: Int {
                get { number }
                set {
                    if newValue > 12 {
                        number = 12
                        projectedValue = true
                    } else {
                        number = newValue
                        projectedValue = false
                    }
                }
            }
            
            init() {
                self.number = 0
                self.projectedValue = false
            }
        }
        
        struct SomeStructure {
            @SmallNumber2 var someNumber: Int
        }
        
        var someStructure = SomeStructure()
        someStructure.someNumber = 4
        print(someStructure.$someNumber) // false
        
        someStructure.someNumber = 55
        print(someStructure.$someNumber) // true
        
        enum Size {
            case small, large
        }
        
        struct SizedRectangle {
            @SmallNumber2 var height: Int
            @SmallNumber2 var width: Int
            mutating func resize(to size: Size) -> Bool {
                switch size{
                case .small:
                    height = 10
                    width = 20
                case .large:
                    height = 100
                    width = 200
                }
                return $height || $width
            }
        }
    }
    propertyWrappers()
    
    func globalAndLocalVar() {
        struct SomeStructure {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 1
            }
        }
        
        enum SomeEnumeration {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 6
            }
        }
        class SomeClass {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 27
            }
            
            class var overrideableComputedTypeProperty: Int {
                return 107
            }
        }
        
        print(SomeStructure.storedTypeProperty) // Some value.
        SomeStructure.storedTypeProperty = "Another value."
        print(SomeStructure.storedTypeProperty) // Another value.
        print(SomeEnumeration.computedTypeProperty) // 6
        print(SomeClass.computedTypeProperty) // 27
        
        struct AudioChannel {
            static let thresholdLevel = 10
            static var maxInputLevelForAllChannels = 0
            var currentLevel: Int = 0 {
                didSet {
                    if currentLevel > AudioChannel.thresholdLevel {
                        // 将当前音量限制在阈值之内
                        currentLevel = AudioChannel.thresholdLevel
                    }
                    if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                        // 存储当前音量作为新的最大输入音量
                        AudioChannel.maxInputLevelForAllChannels = currentLevel
                    }
                }
            }
        }
        
        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        
        leftChannel.currentLevel = 7
        print(leftChannel.currentLevel) // 7
        print(AudioChannel.maxInputLevelForAllChannels) // 7
        
        rightChannel.currentLevel = 11
        print(rightChannel.currentLevel) // 10
        print(AudioChannel.maxInputLevelForAllChannels) // 10
    }
    globalAndLocalVar()
}
