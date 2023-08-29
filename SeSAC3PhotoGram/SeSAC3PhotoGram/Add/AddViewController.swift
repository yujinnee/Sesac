//
//  ViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/28.
//

import UIKit
import SnapKit

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver(notification:)), name: NSNotification.Name("SelectImage"), object: nil)
 
    }
    @objc func selectImageNotificationObserver(notification: NSNotification) {
        print("selectIamgeNotificationObserver")
        print(notification.userInfo?["name"])
        print(notification.userInfo?["sample"])
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }

    }
    
    @objc func searchButtonClicked() {
        let word = ["Apple","Banana","Cokkie","Cake","Sky"]
        NotificationCenter.default.post(name: NSNotification.Name("RecommendKeyword"), object: nil, userInfo: ["word": word.randomElement()!])
        
        present(SearchViewController(),animated:  true)
    }
    
    override func configureView() {
        super.configureView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    override func setConstraints() {
        super.setConstraints()
        print("Add SetConstraints")
        
    }


}


