//
//  ThirdPageViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/28.
//

import UIKit
import SnapKit
class ThirdPageViewController: UIViewController {
    
    let label = {
        let view = UILabel()
        view.text = "세번째 페이지"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return view
    }()
//
//    let button = {
//        let view = UIButton()
//
//        view.backgroundColor = .white
//        view.titleLabel?.textColor = .black
//        view.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .black)
//        return view
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        setConstraints()
        UserDefaults.standard.setValue(true, forKey: "isLaunched")
      
       
    }
    
    func setConstraints(){
        view.addSubview(label)
//        view.addSubview(button)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
//        button.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-20)
//            make.width.equalTo(200)
//            make.height.equalTo(44)
//        }
    }
}
