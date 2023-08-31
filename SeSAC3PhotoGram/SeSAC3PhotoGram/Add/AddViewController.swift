//
//  ViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/28.
//

import UIKit
import SnapKit
import SeSACPhotoFramework

protocol PassDataDelegate {
    func receiveDate(date: Date)
}

class AddViewController: BaseViewController {
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver(notification:)), name: NSNotification.Name.seletImage, object: nil)
        
        APIService.shared.callRequest()
 
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
