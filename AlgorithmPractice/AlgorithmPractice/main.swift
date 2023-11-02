//
//  main.swift
//  AlgorithmPractice
//
//  Created by 이유진 on 10/12/23.
//

import Foundation

//let input = readLine()!.components(separatedBy: " ").map{Int($0)!}

//let input = readLine()!.split(separator: " ").compactMap{Int($0)!}
//let a = input[0]
//let b = input[1]
//print(a+b)


func checkValidate(sentence: String) -> Bool {
    var sentence = Array(sentence)
    var stack = Array<Character>()
    for i in 0..<sentence.count {
//        print(stack)
        if(sentence[i]=="("){
            stack.append(sentence[i])
        }else if(sentence[i]==")"){
            if(stack.count == 0){
                return false
            }
            if(stack.popLast() == "("){
                continue
            }else{
                return false
            }
        }
    }
    if(stack.count>0){
        return false
    }
    return true
}


var num = Int(readLine()!)!
for _ in 0..<num {
    var sentence = readLine()!
    print(checkValidate(sentence: sentence) ? "YES" : "NO")
}

struct Queue<T> {
    private var elements: [T] = []
    init() {}
    mutating func enqueue(with element: T) {
        elements.append(element)
    }
    @discardableResult
    mutating func dequeue() -> T? {
        
    }
    func peek() -> T? {
        elements.first
    }
    
    
}
