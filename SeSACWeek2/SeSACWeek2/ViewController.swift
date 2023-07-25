//
//  ViewController.swift
//  SeSACWeek2
//
//  Created by 이유진 on 2023/07/25.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    let image1URL = URL(string: "https://images.summitmedia-digital.com/cosmo/images/2022/09/12/newjeans-facts-1662964673.jpg")
    let image2URL = URL(string:"https://www.billboard.com/wp-content/uploads/2023/05/NewJeans-cr-ADOR-press-2023-billboard-1548.jpg")

    @IBOutlet var newjeansImageView: UIImageView!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()        
        newjeansImageView.kf.setImage(with: image1URL)

    }

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case Newjeans.hypeboyDaily.rawValue:
            newjeansImageView.kf.setImage(with: image1URL)
        case Newjeans.hypeboyJacket.rawValue:
            newjeansImageView.kf.setImage(with: image2URL)
        default:
            newjeansImageView.kf.setImage(with: image1URL)
        }
        
        
    }
    
}

