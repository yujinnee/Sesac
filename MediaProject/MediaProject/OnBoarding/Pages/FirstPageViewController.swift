//
//  FirstPageViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/28.
//

import UIKit
import SnapKit
class FirstPageViewController: UIViewController {
    
    private let label = {
        let view = UILabel()
        view.text = "첫번째 페이지"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        setConstraints()
    }
    
    private func setConstraints(){
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
