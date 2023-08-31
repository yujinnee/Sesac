//
//  TitleViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

class TitleViewController: BaseViewController {
    
    let textfield = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요"
        return view
    }()
    
    var completionHandler: ((String, Int, Bool) -> Void)?
    
    deinit {
        print("deinit",self)
    }
    
    override func configureView() {
        super.configureView()
        
        view.addSubview(textfield)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
    }
    @objc func doneButtonClicked(){
        print(#function)
        completionHandler?(textfield.text!, 77, false)
        navigationController?.popViewController(animated: true)
    }
    
    override func setConstraints() {
        textfield.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view).inset(10)
            make.height.equalTo(50)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       
    }
    
    
}
