//: [Previous](@previous)

import Foundation

//Any vs Anyobject
//Any: 모든 타입에 대해 대응 가능 (구조체, 열거형, 클래스, 클로저 등) => 런타임에 타입 체크
//Anyobject: 모든 클래스 타입의 인스턴스만 담을 수 있음. => 클래스 제약 설정 가능 : TypeAlias
//ex. Void 도 typealias


func welcome() -> () {
    
}


let name = "고래밥"
let age = 10
let gender = true
let birth = Date()

//let arra÷yList: [AnyObject] = [name, age, gender, birth]

//런타임 시점에 타입이 결정되기 떄문에, 런타임 오류가 발생할 수 있어 사용에 주의가 필요함!!
//arrayList[1] + 1

//: [Next](@next)

