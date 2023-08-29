//
//  ProfileViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

class ProfileViewController: BaseViewController {
    private let mainView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        addObserver()
        setNavigationBar()
     
    }
    override func loadView() {
        self.view = mainView
    }
    
    private func setNavigationBar() {
        navigationItem.title = "프로필 편집"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtontapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self , action: #selector(doneButtontapped))
    }
    @objc private func cancelButtontapped(){
        navigationController?.popViewController(animated: true)
    }
    @objc private func doneButtontapped(){
        navigationController?.popViewController(animated: true)

    }
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(genderPronounNotificationObserver), name: NSNotification.Name("GenderPronoun"), object: nil)
    }
    @objc private func genderPronounNotificationObserver(notification: NSNotification){
        if let text = notification.userInfo?["genderPronoun"] as? String {
            mainView.genderPronounContentsButton.setTitle(text, for: .normal)
            print("22")
        }
    }
    
    private func addTarget(){
        
        mainView.nameContentsButton.addTarget(self, action: #selector(nameContentsButtonTapped), for: .touchUpInside)
        mainView.userNameContentsButton.addTarget(self, action: #selector(userNameContentsButtonTapped), for: .touchUpInside)
        mainView.genderPronounContentsButton.addTarget(self, action: #selector(genderPronounContentsButtonTapped), for: .touchUpInside)
    }
     @objc private func nameContentsButtonTapped(){
        print("이름")
        let vc = NameViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
     @objc private func userNameContentsButtonTapped(){
        let vc = UserNameViewController()
        vc.completionHandler = { text in
            self.mainView.userNameContentsButton.setTitle(text, for: .normal)
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func genderPronounContentsButtonTapped(){
        navigationController?.pushViewController(GenderPronounViewController(), animated: true)
    }
}

extension ProfileViewController: passNameDelegate{
    func receiveName(name: String) {
        mainView.nameContentsButton.setTitle(name, for: .normal)
    }
}
