//
//  DateViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController {
    let mainView = DateView()
    
   
    var delegate: PassDataDelegate?
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.receiveDate(date: mainView.picker.date)
    }
    
}

