//
//  DetailViewController.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contents: String = "빈 공간"

    @IBOutlet var contentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        contentsLabel.numberOfLines = 0
        contentsLabel.textColor = .black
        contentsLabel.text = contents

    }

    @IBAction func deleteButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
       
    }
    

}
