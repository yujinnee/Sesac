//: [Previous](@previous)

import UIKit

//음료 주문: 이름,가격,사이즈
enum DrinkSize {
    case short,tall,grande,venti
}
class DrinkClass {
    let name: String
    var count: Int
    var size: DrinkSize
    
    init(name: String, count: Int, size: DrinkSize) {
        self.name = name
        self.count = count
        self.size = size
    }
}

let drinkclass = DrinkClass(name: "아샷추", count: 3300, size: .venti)
//drinkclass.name = "아앙"
drinkclass.count = 4400
drinkclass.size = .grande

struct DrinkStruct {
    let name: String
    var count: Int
    var size: DrinkSize
}

let drinkStruct = DrinkStruct(name:"아아", count: 2200, size:.tall)
//drinkStruct.name = "아아아"
//drinkStruct.count = 3300
//drinkStruct.size = .venti

struct Poster {
    var image: UIImage = UIImage(systemName: "star") ?? UIImage()
}

struct Movie {
    static let best = "이달의 최고 영화"

    let name: String
    let runtime: Int
    lazy var video: Poster = Poster()

}
var media2 = Movie(name: "내여구", runtime: 20)
media2.video = Poster(image: UIImage(named:"superman") ?? UIImage())

//var media3 = Movie(name: "내여구", runtime: 20,video: Poster())

//struct Movie {
//    static let best = "이달의 최고 영화"
//
//    let name: String
//    let runtime: Int
//    let video: Poster
//}
//
//var media3 = Movie(name: "슈퍼맨", runtime: 3,video: Poster())
//print(media3.video)




let media = Movie(name: "사랑의 불시착", runtime: 130, video: Poster())




//: [Next](@next)
