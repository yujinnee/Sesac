//
//  AsyncViewController.swift
//  SeSAC3Week4
//
//  Created by 이유진 on 2023/08/11.
//

import UIKit

class AsyncViewController: UIViewController {

    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    
    @IBOutlet var thirdImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.backgroundColor = .black
        print("1")
        
        DispatchQueue.main.async {
            print("2")
            self.firstImageView.layer.cornerRadius = self.firstImageView.frame.width / 2
        }
        
        print("3")
        

    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let url = URL(string: "https://api.nasa.gov/assets/img/general/apod.jpg")!
        
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: url)
            
            DispatchQueue.main.async {
                self.firstImageView.image = UIImage(data: data)
            }
        }
     
    }
    


}
