//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/22.
//

import UIKit

class TextViewController: UIViewController {
    
    let photoImageView  = {
        let view = UIImageView()
        view.backgroundColor = .systemMint
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleTextfield = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let dateTextfield = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "날짜을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let contentTextView  = {
        let view = UITextView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        setupConstraints()
    }
    
    func setupConstraints() {

//        for item in [photoImageView,titleTextfield]{
//            view.addSubview(item)
//        }
        
        [photoImageView, titleTextfield, dateTextfield,contentTextView].forEach {
            view.addSubview($0)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextfield.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        dateTextfield.snp.makeConstraints { make in
            make.top.equalTo(titleTextfield.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(dateTextfield.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
