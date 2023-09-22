//
//  ViewModel.swift
//  Week10
//
//  Created by 이유진 on 2023/09/22.
//

import Foundation
import Kingfisher

class Observable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void ) {
        closure(value)
        listener = closure
    }
}

final class ViewModel {
    func request(completion: @escaping (URL) -> Void ) {
        Network.shared.requestConvertible(type: PhotoResult.self, api: Router.random
        ) { response in
            switch response {
            case .success(let success):
                dump(success)
                
                if let imageURL = URL(string: success.urls.thumb) {
                    completion(imageURL)
                }
                
            case .failure(let failure):
                print(failure.errorDescription)
            }
        }
    }
}

