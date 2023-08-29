//
//  ContentViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {
    
    let textview = {
        let view = UITextView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var completionHandler: ((String) -> Void)?
    
    override func configureView() {
        super.configureView()
        
        view.addSubview(textview)
    }
    
    override func setConstraints() {
        textview.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view).inset(10)
            make.height.equalTo(250)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        completionHandler?(textview.text!)
    }
    
    
}

