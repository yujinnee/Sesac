import UIKit


//COW

func address(of object: UnsafeRawPointer) -> String {
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}

var nickname = "SeSAC"
address(of: &nickname)

var newNickname = nickname
address(of: &newNickname)

var newNickname2 = nickname
address(of: &newNickname2)

var newNickname3 = nickname
address(of: &newNickname3)


var array = Array(repeating: "Jack", count: 100)
address(of: &array)

var newArray = array
address(of: &newArray)

var newArray2 = array
address(of: &newArray2)

newArray2[0] = "Hello"
address(of: &newArray2)






//subscript
var list = [1,2,3]


extension String {
    subscript(idx: Int) -> String? {
        
        guard (0..<count).contains(idx) else {
            return nil
        }
        
        let result = index(startIndex,offsetBy: idx)
        return String(self[result])
        
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
var greeting = "Hello, playground"

greeting[2]

greeting[0]
