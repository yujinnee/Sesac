//
//  BeerViewController.swift
//  SeSAC3Week4
//
//  Created by 이유진 on 2023/08/09.
//

import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON


class BeerViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var beerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        callRequest()
      
    }
    

    func callRequest(){
        let url = "https://api.punkapi.com/v2/beers/random"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
//                let json = JSON(value)
                let json = JSON(value).arrayValue
                print("JSON: \(json)")
//                let name = json.["name"].stringValue
//                let image = json[0]["image_url"].stringValue
//                let description = json[0]["description"].stringValue
                let name = json[0]["name"].stringValue
                let image = json[0]["image_url"].stringValue
                let description = json[0]["description"].stringValue
                print(name)
                print(image)
                print(description)
                let imageUrl = URL(string: image)
                self.nameLabel.text = name
                self.descriptionLabel.text = description
                self.beerImageView.kf.setImage(with: imageUrl)
            case .failure(let error):
                print(error)
            }
        }
    }
}
