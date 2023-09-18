//
//  Observable.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/09/13.
//

import Foundation

class Observable<T> {
    private var listener: ((T) -> Void)?
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(_ value: T){
        self.value = value
    }
    
    func bind(completion: @escaping (T) -> Void ){
        completion(value)
        listener = completion
    }
}
