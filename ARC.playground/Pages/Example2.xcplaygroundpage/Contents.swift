//: [Previous](@previous)

import Foundation

class Guild {
    var name: String
    weak var owner: User?
    
    init(name: String) {
        self.name = name
        print("Guild Init")
    }
    
    deinit {
        print("Guild Deinit")
    }
}
	
class User {
    var nickname: String
    var guild: Guild?
    
    init(nickname: String){
        self.nickname = nickname
        print("User Init")
    }
    
    deinit {
        print("User Deinit")
    }
}


var nickname: User? = User(nickname: "미묘한도사")//RC: +1
var guild: Guild? = Guild(name: "Sesac") //RC: +1

nickname?.guild = guild //RC: +1
guild?.owner = nickname//RC: +1

//nickname?.guild = nil//RC -1
//guild?.owner = nil//RC -1

nickname = nil //RC -1
//guild = nil// RC -1


guild?.owner
//nickname?.guild
