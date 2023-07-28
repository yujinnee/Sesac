//: [Previous](@previous)

import Foundation

let number = 3
let numberToString = String(number) //이니셜라이저 구문을 통해 새롭게 인스턴스를 생성한 것 = 형변환

type(of:number)
type(of:numberToString)

class Mobile {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}


class Google: Mobile {
    
}

class Apple: Mobile {
    let conference = "WWDC"
}

let mobile = Mobile(name: "Phone")
let google = Google(name: "구글")
let apple = Apple(name: "애플")

mobile is Mobile
mobile is Google
mobile is Apple

apple is Mobile
apple is Google
apple is Apple

let iphone: Mobile = Apple(name: "iPhone Pro Max")
iphone.name
//iphone.conference //Apple이 가지고 있는 프로퍼티 접근 불가
type(of: iphone)


if let value = iphone as? Apple {
    print(value.conference)
}

if let value = iphone as? Google {
//    print(value.conference) google은 conference 없음
    print(value)
} else{
    print("타입 캐스팅 실패")
}


var something: [Any] = ["a","b","c",true]

something.append(0)
something.append(false)
something.append("d")
something.append(mobile)

print(something)
print(something[4])

let element = something[4]


if let value = element as? Int {
    print(value)
} else {
    print("Int 아님")
}

if let value = element as? String {
    print(value)
} else {
    print("String 아님")
}


