import UIKit

var greeting = "Hello, playground"


func find(num: Int,arr: [Int]) -> Bool {
    var sortedArr = arr.sorted()
    print(sortedArr)
    var start = 0
    var end = arr.count-1

    while(start<end){
        var sum = sortedArr[start]+sortedArr[end]
        print(sum)
        if (sum == num){
            return true
        }else if (sum>num){
            end -= 1
        }else{
            start += 1
        }
    }
    return false
}

func find2(num: Int,arr: [Int]) -> Bool {
    var arrDic: [Int: Void] = [:]
    
    for value in arr {
        arrDic[value] = ()
    }
    
    for value in arr {
        if let _ = arrDic[num-value] {
            return true
        }
    }
    return false
}

//func find(num: Int,arr: [Int]) -> Bool {
//    return true
//}
print(find2(num: 101,arr: [1,100,0]))
print(find2(num: 101,arr: [42,1,30,5,8]))
print(find2(num: 101,arr: [30,42,1,0,11]))


checkValidate(sentence: "((()))")
checkValidate(sentence: "((())))")


//let num = readLine()!
//for i in 0..<num {
//let input = Array(readLine())

func checkValidate(sentence: String) -> Bool {
    var sentence = Array(sentence)
    var stack = Array<Character>()
    for i in 0..<sentence.count {
        print(stack)
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

struct Stack<T> {
    var elements: [T] = []
    init() {}
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        elements.popLast()
    }
}
