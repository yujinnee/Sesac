//
//  ViewController.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

import Alamofire
import SwiftyJSON

class SearchViewController: UIViewController {
    static let identifier = "SearchViewController"

    @IBOutlet var bookSearchBar: UISearchBar!
    @IBOutlet var resultLabel: UILabel!
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        setNavigationBar()
        setSearchBar()

    }
    func design(){
        navigationItem.title = "검색"

    }
    func setNavigationBar(){
        let xmark = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain , target: self , action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    func setSearchBar(){
        bookSearchBar.placeholder = "검색어를 입력해주세요"
        bookSearchBar.showsCancelButton = true
        bookSearchBar.delegate = self

    }
    @objc
    func closeButtonClicked() {
        dismiss(animated: true)
    }

    func callRequest(word: String){
        let url = "https://dapi.kakao.com/v3/search/book?query=" + word
        let header: HTTPHeaders = ["Authorization": APIKeys.kakaoKey]
        
        AF.request(url, method: .get,headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                self.resultLabel.text = "\(json)"
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var word = bookSearchBar.text!
        word = word.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
      callRequest(word: word)
        
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        bookSearchBar.text = ""
        }
}


