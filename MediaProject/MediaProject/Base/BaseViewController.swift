//
//  BaseViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/12.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController{
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        setConstraints()
    }
    
    func configureView() {
        view.backgroundColor = .white
        print("Base ConfigureView")
    }
    
    func setConstraints() {
        print("Base setconstraints")
        
    }

    
}
