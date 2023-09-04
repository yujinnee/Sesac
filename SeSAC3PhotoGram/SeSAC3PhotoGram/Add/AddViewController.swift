//
//  ViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/28.
//

import UIKit
import SnapKit
import SeSACPhotoFramework
import Kingfisher

protocol PassDataDelegate {
    func receiveDate(date: Date)
}

class AddViewController: BaseViewController {
    let imagePicker = UIImagePickerController()
    
    let mainView = AddView()
    
    override func loadView() {
        self.view = mainView
    }
    
    deinit {
        print("deinit",self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
        setDelegate()
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver(notification:)), name: NSNotification.Name.seletImage, object: nil)
        
        APIService.shared.callRequest()
        
    }
    func setDelegate() {
        imagePicker.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver(notification:)), name: NSNotification.Name("SelectImage"), object: nil)
        print(#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self,name: NSNotification.Name("SelectImage"), object: nil)
        
    }
    @objc func selectImageNotificationObserver(notification: NSNotification) {
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
        
    }
    
    @objc func searchButtonClicked() {
        let word = ["Apple","Banana","Cokkie","Cake","Sky"]
        NotificationCenter.default.post(name: NSNotification.Name("RecommendKeyword"), object: nil, userInfo: ["word": word.randomElement()!])
        
        //        present(SearchViewController(),animated:  true)
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func configureView() {
        super.configureView()
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        mainView.dateButton.addTarget(self, action: #selector(dateButtonClicked), for: .touchUpInside)
        mainView.searchProtocolButton.addTarget(self, action: #selector(searchProtocolButtonClicked), for: .touchUpInside)
        mainView.titleButton.addTarget(self, action: #selector(titleButtonClicked), for: .touchUpInside)
        mainView.contentButton.addTarget(self, action: #selector(contentButtonClicked), for: .touchUpInside)
        mainView.searchClosureButton.addTarget(self, action: #selector(searchClosureButtonClicked), for: .touchUpInside)
        
    }
    @objc func searchClosureButtonClicked() {
        let alert = UIAlertController(title: "이미지 불러오기", message: "이미지를 골라주세요", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            self.dismiss(animated: true)
        }
        let web = UIAlertAction(title: "웹에서 검색하기", style: .default) { action in
            let vc  = SearchViewController()
            vc.completionHandler = { imageUrl in
                let url = URL(string: imageUrl)
                self.mainView.photoImageView.kf.setImage(with: url)
            }
//            self.navigationController?.pushViewController(vc, animated: true)
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        let gallery = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { action in
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                        print("갤러리 사용 불가, 사용자에게 토스트/얼럿")
                        return
                    }
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true)
        }
        alert.addAction(web)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        present(alert,animated: true)
       
    }
    @objc func contentButtonClicked() {
        let vc = ContentViewController()
        vc.completionHandler = { text in
            self.mainView.contentButton.setTitle(text, for: .normal)
            //            print("completionHandler")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func titleButtonClicked() {
        let vc = TitleViewController()
        vc.completionHandler = { title, age, push in
            self.mainView.titleButton.setTitle(title, for: .normal)
            print("completionHandler",age,push)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func searchProtocolButtonClicked() {
        let vc = SearchViewController()
        vc.delegate = self
        present(vc,animated:  true)
    }
    @objc func dateButtonClicked() {
        //        let vc = DateViewController()
        //        vc.delegate = self
        //        navigationController?.pushViewController(vc, animated: true)
        
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func setConstraints() {
        super.setConstraints()
    }
    
}


extension AddViewController: PassDataDelegate {
    
    func receiveDate(date: Date) {
        mainView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
    }
    
}
extension AddViewController: passImageDelegate {
    func receiveImageData(image: UIImage) {
        mainView.photoImageView.image = image
    }
    
    
}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           dismiss(animated: true)
       }
       
       //사진을 선택하거나 카메라 촬영 직후 호출
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
               self.mainView.photoImageView.image = image
                       dismiss(animated: true)
                   }
       }
}

