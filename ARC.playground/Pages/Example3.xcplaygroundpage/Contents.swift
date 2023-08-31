//: [Previous](@previous)

import Foundation

class User {
    let nickname = "JACK"
    
    lazy var introduce: () -> String = { [weak self] in
        return "안녕하세요\(self?.nickname) \(Int.random(in: 1...100))입니다."
    }
    
    init() {
        print("User Init")
    }
    
    deinit {
        print("User Deinit")
    }
}

var user: User? = User()
user?.nickname
let result = user?.introduce
user = nil
print(result!())
print(result!())
print(result!())



