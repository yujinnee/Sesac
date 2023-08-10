//: [Previous](@previous)

import Foundation

//매개변수 X 반환값 X
//() -> ()
func welcome() {
    print("안녕하세요 반갑습니다")
}

//매개변수 O 반환값 X
//(String) -> ()
func welcome(name:String) {
    print("안녕하세요 \(name)님, 반갑습니다")
}

//매개변수 O 반환값 O
//(String) -> (String)
func welcome(name:String) -> String {
    return "안녕하세요 \(name)님, 반갑습니다"
}

//매개변수 X 반환값 O
//() -> (String)
func welcome() -> String {
    return "안녕하세요 반갑습니다"
}

func introduce(message: (String) -> ()){
    
}

//introduce(message: welcome(name:"얍"))

func checkBankInformation(bank: String) -> Bool {
    let bankArray = ["우리","신한","국민"]
    return bankArray.contains(bank) ? true : false
}

//변수나 상수에 함수를 실행해서 반환된 반환값을 대입 한 것 (1급 객체의 특성은 아님)
let result = checkBankInformation(bank: "농협")

//변수나 상수에 함수 그 '자체'를 대입할 수 있다 (1급 객체의 특성)
//함수만 대입한 것으로, 함수가 실행된 상태는 아님
let checkAccount: (String) -> Bool = checkBankInformation

//함수를 호출하면 실행할 수 있음

checkAccount("신한")

let tupleExample: (Int,Int,Int,String,Bool) = (1,2,33,"Hello",true)
tupleExample.3

// (String) -> String
func hello(username: String) -> String {
    return "저는 \(username)입니다"
}

func hello(nickname: String) -> String {
    return "저는 \(nickname)라는 닉네임을 갖고 있습니다."
}

//(Strgin, Int) -> String
func hello(username: String, age: Int) -> String {
    return "저는 \(username), \(age)살 입니다."
}

let exmple = hello(nickname:)

exmple("고래밥")


func currentAccout() -> String { // () -> String
    return "계좌 있다는 얼럿 띄우기"
}

func noCurrentAccount() -> String { // () -> String
    return "계좌 없으니 계좌 생성화면으로 이동"
}

//func checkBankInformation(bank: String) -> Bool {
//    let bankArray = ["우리","신한","국민"]
//    return bankArray.contains(bank) ? true : false
//}

//가장 왼쪽에 위치한 -> 를 기준으로, 오른쪽에 놓인 모든 타입은 반환값을 의미한다.
func checkBank(bank: String) -> () -> String {
    let bankArray = ["우리","신한","국민"]
    return bankArray.contains(bank) ? currentAccout : noCurrentAccount
}

let jack = checkBank(bank: "신한")
jack()

checkBank(bank: "신한")()


func plus(a: Int, b: Int) -> Int {
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a-b
}

func multiply(a: Int, b: Int) -> Int {
    return a*b
}

func divide(a: Int, b: Int) -> Int {
    return a/b
}

func calculate(operand: String) -> (Int, Int) -> Int {
    switch operand {
    case "+": return plus
    case "-": return minus
    case "*": return multiply
    case "/": return divide
    default: return plus
    }
}

calculate(operand: "+")(3,4)

let resultCalculate = calculate(operand: "*")
resultCalculate(5,9)


//3. 함수의 인자값으로 함수를 사용할 수 있다.

func oddNumber() {
    print("홀수")
}

func evenNumber() {
    print("짝수")
}
func setLabel() {
    print("레이블")
}
func setNavigationoBar(){
    print("네비게이션")
}

func resultNumber(number: Int, odd: () -> Void,even: () -> Void) {
    return number.isMultiple(of: 2) ? even() : odd()
}

resultNumber(number: 8, odd: oddNumber, even: evenNumber)
resultNumber(number: 29, odd: {
    print("홀수")
}, even: {
    print("짝수")
})
