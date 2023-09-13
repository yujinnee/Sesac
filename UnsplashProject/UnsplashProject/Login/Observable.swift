//
//  Observable.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/12.
//

import Foundation

class Observable<T> {
    private var listener: ((T) -> Void)? = { nickname in
        print(nickname)//얼럿 레이블...화면전환
    }
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value:T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value)
        listener = closure
    }
    

}
