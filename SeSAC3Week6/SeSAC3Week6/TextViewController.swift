//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/22.
//

import UIKit

class TextViewController: UIViewController {
    let picker = UIImagePickerController()
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("갤러리 사용 불가, 사용자에게 토스트/얼럿")
            return
        }
        
//        picker.delegate = self
//        picker.sourceType = .camera
//        picker.allowsEditing = true
        
        let picker = UIColorPickerViewController()
        
        present(picker, animated: true)
       
     
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


extension TextViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
        dismiss(animated: true)
    }
    
    //사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.photoImageView.image = image
            dismiss(animated: true)
        }
        
        print(#function)
    }
}
