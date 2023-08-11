//: [Previous](@previous)

import Foundation

print("HELLO")

DispatchQueue.main.async {
    for i in 1...100 {
        print(i, terminator: " ")
    }
}

for i in 1...100 {
    print(i, terminator:  " ")
}

for i in 101...200 {
    print(i, terminator: " ")
}

print("BYE")

//====================

print("hello")

for i in 1...100 {
    DispatchQueue.global().sync {
        print(i, terminator:  " ")
    }
}

for i in 101...200 {
    print(i, terminator: " ")
}

print("bye")

//===================
 
