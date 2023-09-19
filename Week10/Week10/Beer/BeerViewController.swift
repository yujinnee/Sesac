//
//  BeerViewController.swift
//  Week10
//
//  Created by 이유진 on 2023/09/19.
//

import UIKit

class BeerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getBeers()
        getBeer(id: "3")
//        getRandomBeer()
    }
    
}

private func getBeers(){
    BeerNetworkManager.shared.request(type: Beers.self, api: .beers) { response in
        switch response {
        case .success(let success):
            dump(success)
        case .failure(let failure):
            print(failure.errorDescription)
            
        }
    }
    
}
private func getBeer(id: String){
    
    BeerNetworkManager.shared.request(type: Beers.self, api: .singleBeer(id: id)) { response in
        switch response {
        case .success(let success):
            dump(success)
            print("ADf")
        case .failure(let failure):
            print(failure.errorDescription)
        
            
        }
    }
}

private func getRandomBeer(){
    BeerNetworkManager.shared.request(type: Beers.self, api: .randomBeer) { response in
        switch response {
        case .success(let success):
            dump(success)
        case .failure(let failure):
            print(failure.errorDescription)
            
        }
    }
}
