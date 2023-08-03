//
//  ViewController.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

class SearchViewController: UIViewController {
    static let identifier = "SearchViewController"

    @IBOutlet var screenLabel: UILabel!
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        setNavigationBar()
    }
    func design(){
        navigationItem.title = "검색"
        screenLabel.text = "검색화면"
    }
    func setNavigationBar(){
        let xmark = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain , target: self , action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    @objc
    func closeButtonClicked() {
        dismiss(animated: true)
    }


}

