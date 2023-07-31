//
//  ViewController.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "추가 화면"
        let xmark = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain , target: self , action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .red
    }
    
    @objc func closeButtonClicked() {
        dismiss(animated: true)
      
    }


}

