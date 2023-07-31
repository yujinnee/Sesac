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
        print(navigationController)
        title = "추가 화면"
        let xmark = UIImage(systemName: "xmark")
        print(navigationItem.leftBarButtonItem)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain , target: self , action: #selector(closeButtonClicked))
        print(navigationItem.leftBarButtonItem)
        navigationItem.leftBarButtonItem?.tintColor = .red
    }
    
    @objc func closeButtonClicked() {
        dismiss(animated: true)
      
    }


}

