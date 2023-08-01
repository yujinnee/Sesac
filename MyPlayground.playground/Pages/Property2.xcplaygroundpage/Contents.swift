//: [Previous](@previous)

import Foundation

struct User {
    var nickname: String
    //선언과 초기화를 동시에 or 선언만 해두고 인스턴스 생성 시 초기화 해도 됨!
    //인스턴스 프로퍼티 + 저장 프로퍼티
    
    static var originName: String = "진짜 이름"
    //타입 프로퍼티(Meta Type) + 저장 프로퍼티
    //사용하게 되는 순간 메모리에 올라감, 앱 종료까지 메모리 유지
    //지연 저장 프로퍼티(lazy) 처럼 동작
    
    //인스턴스 프로퍼티 + 연산 프로퍼티
    //값을 초기화하고 저장할 수 있는 공간이 없고, 다른 저장 프로퍼티의 값을 연산해서 간접적으로 값을 제공!
    var userIntroduce: String {
        get {
            return "이 사용자의 닉네임은 \(nickname)이고, 진짜 이름은 \(User.originName)입니다."
        }
    }
}

let user = User(nickname: "고래밥")
user.nickname
let user2 = User(nickname: "Jack")
user2.nickname


let user3 = User(nickname: "Bran")
user3.nickname
let computedProperty = user3.userIntroduce

struct BMI {
    var weight: Double
    var height: Double
    var BMIResult: String {
        get {
            let bmiValue = weight / (height * height)
            let bmiStatus = bmiValue < 18.5 ? "저체중" : "정상 이상"
            return "고래밥님의 BMI 지수는 \(bmiValue)로 \(bmiStatus)입니다."
        }
    }
    
}


//Enum: 컴파일
//초기화 불가능, 인스턴스 생성 불가능
enum Grade: String {
    case A = "100점",B,C,D,E
    
    static let introduce = "학점"
}

Grade.introduce

enum ResourceString: String {
    case save = "저장"
    case add = "추가"
//    case addButton = "추가"
    static let addIcon = "추가"
    static let addButton = "추가"
}
ResourceString.add.rawValue
