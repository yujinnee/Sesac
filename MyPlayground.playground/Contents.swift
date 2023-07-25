//: [Previous](@previous)

import UIKit

//1. 미디어 종류 - 영화 / 드라마 / 애니메이션
enum Media {
    case movie, drama, animation
}

var media: Media = .movie

if media == .movie {
    print("영화 선택")
} else if media == .drama {
    print("드라마 선택")
} else if media == .animation {
    print("애니메이션 선택")
} else {
    print("기타 선택")
}

//default 생략 가능함.
switch media{
case .movie: print("영화 선택")
case .drama: print("드라마 선택")
case .animation: print("애니메이션 선택")
}
//2. 성별 - 남성 / 여성
enum Gender: String {
    case man
    case woman
}
var user: Gender = .man

if user == .man {
    print("\(user.rawValue)을 선택했습니다.")
} else {
    print("\(user.rawValue)을 선택했습니다.")
}

enum Words: Int,CaseIterable{
    case newjeans = 100
    case haerin = 200
    case hyein
    case hanni
    case minji
    case danielle
    case bunnies
}

let wordList: [Words] = [.newjeans,.haerin,.bunnies,.danielle,.hanni]
print(wordList[0])

let newWordList = Words.allCases
print(newWordList[0])

print(Words.newjeans.rawValue)
print(Words.haerin.rawValue)
print(Words.hyein.rawValue)
print(Words.hanni.rawValue)

var tag = 100
Words(rawValue:  tag)
