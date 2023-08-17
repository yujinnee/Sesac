import UIKit

struct User {
    let name = "고래밥"
    static let originalName = "JACK"
}

User.originalName

let user = User()
user.name
type(of: user.name)



type(of: user).name
type(of: user).originalName

print(type(of: user.name))
print(type(of: user))



// "고래밥" => String
// String => String.Type

//String은 인스턴스(ex. 고래밥)의 타입
//User() => User
//User -> User.type
//메타 타입은 클래스 구조체 열거형 등의 유형 그 자체를 가리킴


let number: Int = 8.self


let result = Int.type = Int.self
