//
//  UserNameViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

class UserNameViewController: BaseViewController {
    var completionHandler: ((String)->(Void))?
    private  let contentsNameLabel = {
        let view = UILabel()
        view.text = "사용자 이름"
        view.textColor = .gray
        return view
    }()
    private let contentsTextField = {
        let view = UITextField()
        view.borderStyle = .bezel
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    
    }
    override func viewDidDisappear(_ animated: Bool) {
        completionHandler?(contentsTextField.text!)
    }
    private func setNavigationBar() {
        navigationItem.title = "사용자 이름"
    }
    
    override func setConstraints() {
        view.addSubview(contentsNameLabel)
        view.addSubview(contentsTextField)
        
        contentsNameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        contentsTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(contentsNameLabel.snp.bottom).offset(30)
        }
    }

}
