//: [Previous](@previous)

import Foundation




struct BabyMonsterStruct {
    var name: String
    var exp: Int
    var speed: Int
    var power: Int
}

class BabyMonster {
    var name: String
    var exp: Int
    var speed = 1
    var power = 1
    
    init(name: String, exp: Int) {
        self.name = name
        self.exp = exp
    }
}

let classbaby = BabyMonster(name: "클래스몬스터", exp: 10)

classbaby.exp = 5

let structbaby = BabyMonsterStruct(name: "구조체몬스터", exp: 10, speed: 3, power: 2)
//structbaby.exp = 10

var baby = BabyMonsterStruct(name: "구조체몬스터", exp: 10, speed: 3, power: 2)
let secondBaby = baby

print(baby.exp)
print(secondBaby.exp)

baby.exp = 100

print(baby.exp)
print(secondBaby.exp)


var nickname = "고래밥"
var subNickname = nickname

nickname = "칙촉"

print(nickname)
print(subNickname)



baby.name
baby.exp
baby.speed
baby.power


//쉬운 몬스터 * 100
class Monster {
    var exp = 1
    var clothes = "빨강"
    var speed = 1
    var power = 1
    func attack(){
        print("공격")
    }
}

let easy = Monster()
easy.exp
easy.clothes
easy.speed
easy.power

let hard = Monster()
hard.exp = 100
hard.clothes = "파랑"
hard.speed = 20
hard.power = 1000

hard.exp
hard.clothes
hard.speed
hard.power

class BossMonster: Monster {
    var specialItem = "레벨업"
    override func attack() {
        super.attack()
        print("보스 몬스터 공격")
    }
    
}

let boss = BossMonster()
boss.specialItem
boss.exp
boss.power
boss.speed
boss.clothes
boss.attack()
