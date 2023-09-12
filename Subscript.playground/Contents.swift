import UIKit



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
