//
//  StructuresAndClasses.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 1.11.22.
//

import Foundation

func structuresAndClasses() {
    /*
     共同点：
     定义属性用于存储值
     定义方法用于提供功能
     定义下标操作用于通过下标语法访问它们的值
     定义构造器用于设置初始值
     通过扩展以增加默认实现之外的功能
     遵循协议以提供某种标准功能
     
     与结构体相比，类额外的附加功能：
     继承允许一个类继承另一个类的特征
     类型转换允许在运行时检查和解释一个类实例的类型
     析构器允许一个类实例释放任何其所被分配的资源
     引用计数允许对一个类的多次引用
     */
    
    func definition() {
        struct SomeStructure {
            // 在这里定义机构提
        }
        
        class SomeClass {
            // 在这里定义类
        }
        
        struct Resolution {
            var width = 0
            var height = 0
        }
        
        class VideoMode {
            var resolution = Resolution()
            var interlaced = false
            var frameRate = 0.0
            var name: String?
        }
        
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        print("The width of someResolution is \(someResolution.width)") // The width of someResolution is 0
        print("The width of someVideoMode is \(someVideoMode.resolution.width)") // The width of someResolution is 0
        
        // 结构体和枚举是值类型
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is \(someVideoMode.resolution.width)") // The width of someVideoMode is 1280
        
        let vga = Resolution(width: 640, height: 480)
        print(vga) // Resolution(width: 640, height: 480)
        
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        print(cinema) // Resolution(width: 1920, height: 1080)
        cinema.width = 2048
        print("cinema is now \(cinema.width) pixels wide") // cinema is now 2048 pixels wide
        // hd未被改变，说明结构体是复制
        print("hd is still \(hd.width) pixels wide") // hd is still 1920 pixels wide
        
        // 枚举与结构体相同，会复制一个新的出来
        enum CompassPoint {
            case north, south, east, west
            mutating func turnNorth() {
                self = .north
            }
        }
        var currentDirection = CompassPoint.west
        let rememberedDirection = currentDirection
        currentDirection.turnNorth()

        print("The current direction is \(currentDirection)")
        print("The remembered direction is \(rememberedDirection)")
        // 打印 "The current direction is north"
        // 打印 "The remembered direction is west"
        
        // 类是引用类型
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty
        // 修改新的对象内容，会导致之前的对象内容被改变，说明类的对象是引用类型
        alsoTenEighty.frameRate = 30.0
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)") // The frameRate property of tenEighty is now 30.0
        
        // 三个等号是表明两个常量或变量引用了同一个类实例
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.") // tenEighty and alsoTenEighty refer to the same VideoMode instance.
        }
        
        
    }
    definition()
    
    
}
