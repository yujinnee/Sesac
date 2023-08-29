//
//  ProfileViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

class ProfileViewController: BaseViewController {
    let mainView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        addObserver()
     
    }
    override func loadView() {
        self.view = mainView
    }
    
    func setNavigationBar() {
//        naviga
    }
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(genderPronounNotificationObserver), name: NSNotification.Name("GenderPronoun"), object: nil)
    }
    @objc func genderPronounNotificationObserver(notification: NSNotification){
        if let text = notification.userInfo?["genderPronoun"] as? String {
            mainView.genderPronounContentsButton.setTitle(text, for: .normal)
            print("22")
        }
    }
    
    func addTarget(){
        
        mainView.nameContentsButton.addTarget(self, action: #selector(nameContentsButtonTapped), for: .touchUpInside)
        mainView.userNameContentsButton.addTarget(self, action: #selector(userNameContentsButtonTapped), for: .touchUpInside)
        mainView.genderPronounContentsButton.addTarget(self, action: #selector(genderPronounContentsButtonTapped), for: .touchUpInside)
    }
    @objc func nameContentsButtonTapped(){
        print("이름")
        let vc = NameViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func userNameContentsButtonTapped(){
        let vc = UserNameViewController()
        vc.completionHandler = { text in
            self.mainView.userNameContentsButton.setTitle(text, for: .normal)
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func genderPronounContentsButtonTapped(){
        navigationController?.pushViewController(GenderPronounViewController(), animated: true)
    }
}

extension ProfileViewController: passNameDelegate{
    func receiveName(name: String) {
        mainView.userNameTitleLabel.text = name
    }
}
