//
//  DetailViewController.swift
//  PhotoGramRealm
//
//  Created by 이유진 on 2023/09/05.
//

import UIKit
import SnapKit
import RealmSwift

class DetailViewController: BaseViewController {
    
    var data: DiaryTable?
    let realm = try! Realm()
    let repository = DiaryTableRepository()
    
    let titleTextField: WriteTextField = {
        let view = WriteTextField()
        view.placeholder = "제목을 입력해주세요"
        view.textColor = Constants.BaseColor.text
        return view
    }()
    
    let contentTextField: WriteTextField = {
        let view = WriteTextField()
        view.placeholder = "내용을 입력해주세요"
        view.textColor = Constants.BaseColor.text
        return view
    }()
    

    override func configure() {
        view.addSubview(titleTextField)
        view.addSubview(contentTextField)
        
        guard let data = data else { return }
        
        titleTextField.text = data.diaryTitle
        contentTextField.text = data.contents
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(editbuttonClicked))
    }
    @objc func editbuttonClicked() {
        print("clicked")
        guard let data = data else { return}
        
        /*
        let item = DiaryTable(value: ["_id": data._id,"diaryTitle": titleTextField.text!,"diaryContents": contentTextField.text!])
      
        //try!방식
        try! realm.write {
            realm.add(item,update: .modified)
         
        }
        //do-try-catch 방식
        do {
            try realm.write {
                realm.add(item,update: .modified)
            }
        } catch {
            print("")//NSlog 같은 거로 기록을 남기던가 집계를 하기도 함.
        }
         */
        
        repository.updateItem(
            _id: data._id,
            diaryTitle: titleTextField.text!,
            diaryContents: contentTextField.text!
        )
        
       
        
        navigationController?.popViewController(animated: true)
    }
    override func setConstraints() {
        super.setConstraints()
        titleTextField.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.center.equalTo(view)
        }
        contentTextField.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(60)
        }
    }



}
