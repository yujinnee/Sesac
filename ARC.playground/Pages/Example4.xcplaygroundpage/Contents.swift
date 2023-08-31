//: [Previous](@previous)

import Foundation

func makeIncrement(value: Int) -> () -> Int{
    var total = 0
    
    func increment() -> Int { //외부 함수의 생명은 끝났지만, 내부함수는 아직 살아 있는 상태 ..
        total += value // total, value 라는 값을 내부적으로 저장하고 있다(캡쳐)
        return total // 클로저는 값을 캡쳐할 때, 값 타입인지 참조타입인지와 상관 없이 Reference Capture를 한다.
    }
    
    return increment
}

let result = makeIncrement(value:10)


result()
result()
result()
result()


func sampleClosure() {
    var number = 0
    print("1 - \(number)")
    
    let closure: () -> Void = {[number] in
        print("closure - \(number)")
    }
    closure()
    
    number = 100
    closure()
    
    print("2 - \(number)")
}

sampleClosure()
