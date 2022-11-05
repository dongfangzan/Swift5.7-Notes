//
//  OptionalChaining.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 5.11.22.
//

import Foundation

// 可选链式调用是一种可以在当前值可能为 nil 的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是 nil，那么调用将返回 nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为 nil，整个调用链都会失败，即返回 nil。
func optionalChaining() {
    func unwrapped() {
        class Person {
            var residence: Residence?
        }
        
        class Residence {
            var numberOfRooms = 1
        }
        
        let john = Person()
    //    let roomCount = try john.residence!.numberOfRooms  触发运行时错误
        
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.") // Unable to retrieve the number of rooms.
        }
        
        john.residence = Residence()
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).") // John's residence has 1 room(s).
        } else {
            print("Unable to retrieve the number of rooms.")
        }
    }
    unwrapped()
    
    func model() {
        class Person {
            var residence: Residence?
        }
        
        class Residence {
            var rooms: [Room] = []
            var numberOfRooms: Int {
                return rooms.count
            }
            subscript(i: Int) -> Room {
                get {
                    return rooms[i]
                }
                set {
                    rooms[i] = newValue
                }
            }
            
            func printNumberOfRooms() {
                print("The number of rooms is \(numberOfRooms)")
            }
            
            var address: Address?
        }
        
        
        class Room {
            let name: String
            init(name: String) { self.name = name }
        }
        
        class Address {
            var buildingName: String?
            var buildingNumber: String?
            var street: String?
            func buildingIndeitifier() -> String? {
                if buildingName != nil {
                    return buildingName
                } else if let buildingNumber = buildingNumber, let street = street {
                    return "\(buildingNumber) \(street)"
                } else {
                    return nil
                }
            }
        }
        
        let john = Person()
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Uanble to retrieve the number of rooms.") //Uanble to retrieve the number of rooms.
        }
        
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"
        john.residence?.address = someAddress
        
        func createAddress() -> Address {
            print("Function was called.")
            
            let someAddress = Address()
            someAddress.buildingNumber = "29"
            someAddress.street="Acacia Road"
            return someAddress
        }
        
        john.residence?.address = createAddress() // 并未执行函数
        
        if john.residence?.printNumberOfRooms() != nil {
            print("It was possible to print the number of rooms.")
        } else {
            print("It was not possible to print the number of rooms.") // It was not possible to print the number of rooms.
        }
        
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.") // Unable to retrieve the first room name.
        }
        
        john.residence?[0] = Room(name: "Bathroom") // 还是为空，residence未创建
        
        let johnsHouse = Residence()
        johnsHouse.rooms.append(Room(name: "Living Room"))
        johnsHouse.rooms.append(Room(name: "Kitchen"))
        john.residence = johnsHouse
        
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).") // The first room name is Living Room.
        } else {
            print("Unable to retrieve the first room name.")
        }
        
        var testScores = ["Dave": [86, 82, 84], "Bev":[79, 94, 81]]
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brian"]?[0] = 72
        print(testScores) // ["Dave": [91, 82, 84], "Bev": [80, 94, 81]]
        // 没有Brain，所以第三个调用失败
        
        // 两层可选链
        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.") // Unable to retrieve the address.
        }
        
        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence?.address = johnsAddress

        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).") // John's street name is Laurel Street.
        } else {
            print("Unable to retrieve the address.")
        }
        
        if let buildingIndentifier = john.residence?.address?.buildingIndeitifier() {
            print("John's building identifier is \(buildingIndentifier)") // John's building identifier is The Larches
        }
        
        if let beginsWithThe = john.residence?.address?.buildingIndeitifier()?.hasPrefix("The") {
            if beginsWithThe {
                print("John's building identifier begins with \"The\".") // John's building identifier begins with "The".
            } else {
                print("John's building identifier does not begin with \"The\".")
            }
        }
    }
    model()
    
    
}
