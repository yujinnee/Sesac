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
    
    var nickname: String {
        willSet {
            print("닉네임이 \(nickname)에서 \(newValue)로 변경 될 예정입니다.")
        }
        didSet {
            print("닉네임이 \(oldValue)에서 \(nickname)로 변경되었습니다.")
        }
    }
       
    var weight: Double
    var height: Double
    
    var BMIResult: String {
        get {
            let bmiValue = weight / (height * height)
            let bmiStatus = bmiValue < 18.5 ? "저체중" : "정상 이상"
            return "\(nickname)님의 BMI 지수는 \(bmiValue)로 \(bmiStatus)입니다."
        }
        set {
            nickname = newValue
        }
    }
    
}

var bmi = BMI(nickname: "고래밥", weight: 70, height: 1.8)
print(bmi.BMIResult)

bmi.nickname = "칙촉"
bmi.BMIResult = "새우깡"
print(bmi.BMIResult)



class FoodRestaurant {
    let name = "잭치킨"
    var totalOrderCount = 10
    var newOrder: Int {
        get {
            return totalOrderCount * 5000
        }
        set {
            totalOrderCount += newValue
        }
        
    }
}

let food = FoodRestaurant()
food.newOrder
food.newOrder = 30
food.newOrder

class TypeFoodRestaurant {
    static let name = "잭치킨"
    static var totalOrderCount = 10 {
        willSet {
            print("총 주문 건수가 \(totalOrderCount)에서 \(newValue)로 변경될 예정입니다.")
        }
        didSet {
            print("총 주문 건수가 \(oldValue)에서 \(totalOrderCount)로 변경 될 예정입니다.")
        }
    }
    static var newOrder: Int {
        get {
            return totalOrderCount * 5000
        }
        set {
            totalOrderCount += newValue
        }
    }
}
TypeFoodRestaurant.newOrder
TypeFoodRestaurant.newOrder = 50
TypeFoodRestaurant.newOrder


/*

struct Coffe {
    static var name = "아메리카노"
    static var shot = 2
    
    static func plusShot() {
        shot += 1
    }
}

class Latte: Coffe {
    override class func plusShot() {
        
    }
}

*/

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
