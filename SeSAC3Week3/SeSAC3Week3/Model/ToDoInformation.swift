//
//  ToDoInformation.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/28.
//

import UIKit

struct ToDoInformation {
    //인스턴스 프로퍼티
    var list = [ToDo(main: "잠자기", sub: "23.07.03", like: false, done: true, color: randomBackgroundColor()),
                ToDo(main: "영화보기", sub: "23.07.30", like: true, done: false, color: randomBackgroundColor()),
                ToDo(main: "장보기", sub: "23.08.13", like: false, done: false, color: randomBackgroundColor())]
    //타입 메서드
    static func randomBackgroundColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}
