//
//  ClassOpenExample.swift
//  SeSACPhotoFramework
//
//  Created by 이유진 on 2023/08/29.
//

import Foundation

open class ClassOpenExample {
    private static func privateExample() {
        print(#function)
    }
    
    fileprivate static func fileprivateExample() {
        print(#function)
    }
    
    internal static func internalExample() {
        print(#function)
    }
    
    public static func publicExample() {
        print(#function)
    }
    
    open func openExample() {
        print(#function)
    }
}

public class ClassPublicExample {
    private static func privateExample() {
        print(#function)
    }
    
    fileprivate static func fileprivateExample() {
        print(#function)
    }
    
    internal static func internalExample() {
        print(#function)
    }
    
    public static func publicExample() {
        print(#function)
    }
}

class ClassInternalExample {
    private static func privateExample() {
        print(#function)
    }
    
    fileprivate static func fileprivateExample() {
        print(#function)
    }
    
    internal static func internalExample() {
        print(#function)
    }
    
    public static func publicExample() {
        print(#function)
    }
}
