//
//  TypeCasting.swift
//  Swift5.7-Notes
//
//  Created by 东方赞 on 5.11.22.
//

import Foundation

func typeCasting() {
    class MediaItem {
        var name: String
        init(name: String) {
            self.name = name
        }
    }
    
    class Movie: MediaItem {
        var director: String
        init(name: String, director: String) {
            self.director = director
            super.init(name: name)
        }
    }
    
    class Song: MediaItem {
        var artist: String
        init(name: String, artist: String) {
            self.artist = artist
            super.init(name: name)
        }
    }
    
    let library = [
        Movie(name: "Casablanca", director: "Michael Curtiz"),
        Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
        Movie(name: "Citizen Kane", director: "Orson Welles"),
        Song(name: "The One And Only", artist: "Chesney Hawkes"),
        Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
    ]
    // 数组 library 的类型被推断为 [MediaItem]
    
    var movieCount = 0
    var songCount = 0
    for item in library {
        if item is Movie {
            movieCount += 1
        } else if item is Song {
            songCount += 1
        }
    }
    
    print("Media library contains \(movieCount) movies and \(songCount) songs.") // Media library contains 2 movies and 3 songs.
    
    // 当你不确定向下转型可以成功时，用类型转换的条件形式（as?）
    // 只有你可以确定向下转型一定会成功时，才使用强制形式（as!）
    for item in library {
        if let movie = item as? Movie {
            print("Movie: \(movie.name), dir. \(movie.director)")
        } else if let song = item as? Song {
            print("Song: \(song.name), by \(song.artist)")
        }
    }
    // Movie: Casablanca, dir. Michael Curtiz
    // Song: Blue Suede Shoes, by Elvis Presley
    // Movie: Citizen Kane, dir. Orson Welles
    // Song: The One And Only, by Chesney Hawkes
    // Song: Never Gonna Give You Up, by Rick Astley
    
    var things: [Any] = []
    things.append(0)
    things.append(0.0)
    things.append(42)
    things.append(3.14159)
    things.append("hello")
    things.append((3.0,5.0))
    things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
    things.append({(name: String) -> String in "Hello, \(name)"})
    
    for thing in things {
        switch thing {
        case 0 as Int:
            print("zero as an Int")
        case 0 as Double:
            print("zero as a Double")
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I don't want to print")
        case let someString as String:
            print("a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let movie as Movie:
            print("a movie called \(movie.name), dir. \(movie.director)")
        case let stringConverter as (String) -> String:
            print(stringConverter("Michael"))
        default:
            print("something else")
        }
    }
    
    // zero as an Int
    // zero as a Double
    // an integer value of 42
    // a positive double value of 3.14159
    // a string value of "hello"
    // an (x, y) point at 3.0, 5.0
    // a movie called Ghostbusters, dir. Ivan Reitman
    // Hello, Michael
    
    // Any 类型可以表示所有类型的值，包括可选类型。Swift 会在你用 Any 类型来表示一个可选值的时候，给你一个警告。如果你确实想使用 Any 类型来承载可选值，你可以使用 as 操作符显式转换为 Any
    let optionalNumber: Int? = 3
    things.append(optionalNumber) // 警告
    things.append(optionalNumber as Any)
}
