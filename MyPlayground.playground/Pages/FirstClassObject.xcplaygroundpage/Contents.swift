//: [Previous](@previous)

import Foundation

//매개변수 X 반환값 X
//(String -> ()
func welcome() {
    print("안녕하세요 반갑습니다")
}

//매개변수 O 반환값 X
func welcome(name:String) {
    print("안녕하세요 \(name)님, 반갑습니다")
}

//매개변수 O 반환값 O
func welcome(name:String) -> String {
    return "안녕하세요 \(name)님, 반갑습니다"
}

//매개변수 X 반환값 O
func welcome() -> String {
    return "안녕하세요 반갑습니다"
}







//: [Next](@next)
