//
//  DetailViewController.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    static let identifier = "DetailViewController"
    @IBOutlet var screenLabel: UILabel!
    var navigationTitle: String = "타이틀"


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = navigationTitle
        let chevron = UIImage(named: "chevron.left")
        
//        print(navigationController?.navigationItem)
//        print(navigationItem)
////        print(navigationItem.leftBarButtonItem)
    
        let button = UIBarButtonItem(image: chevron, style: .plain, target: self, action: #selector(previousButtonTapped))
//        let button = UIBarButtonItem(customView: UIImageView(image: chevron))
       
        navigationController?.navigationItem.setLeftBarButton(button, animated: false)
        
//        navigationController!.navigationItem.leftBarButtonItem?.title = ""
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: chevron, style: .plain, target: self, action: #selector(previousButtonTapped))
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: chevron, style: .plain, target: self, action: #selector(previousButtonTapped))
//        print(navigationItem.leftBarButtonItem)
//        navigationItem.leftBarButtonItem?
        navigationItem.leftBarButtonItem?.tintColor = .red
    
        screenLabel.text = "상세화면"

    }
    @objc
    func previousButtonTapped(){
        navigationController?.popViewController(animated: true)
    }

}
