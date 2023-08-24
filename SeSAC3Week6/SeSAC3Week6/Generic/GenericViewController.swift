//
//  GenericViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/24.
//

import UIKit

class GenericViewController: UIViewController {
    
    let sampleLabel = UILabel()
    let sampleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        configureBorder(view: sampleLabel)
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        
        
        let generic  = sum(a: 3.3444, b: 4.77)

    }
  
}
