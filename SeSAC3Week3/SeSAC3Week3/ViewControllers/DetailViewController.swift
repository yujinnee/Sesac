//
//  DetailViewController.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/08/02.
//

import UIKit

class DetailViewController: UIViewController {
    var data: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = data else {return}
        print(data)
    }
}
