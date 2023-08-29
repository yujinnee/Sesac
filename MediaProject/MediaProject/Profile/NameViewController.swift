//
//  NameViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

protocol passNameDelegate{
    func receiveName(name:String)
}

class NameViewController: BaseViewController {
    var delegate: passNameDelegate?
    let contentsNameLabel = {
        let view = UILabel()
        view.text = "이름"
        view.textColor = .gray
        return view
    }()
    let contentsTextField = {
        let view = UITextField()
        view.borderStyle = .bezel
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()

    }
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.receiveName(name: contentsTextField.text!)
    }
    func setNavigationBar() {
        navigationItem.title = "이름"
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
