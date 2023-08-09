//
//  ViewController.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

import Alamofire
import SwiftyJSON

struct Book {
    let title: String
    let price: Int
    let authors: [String]
    let thumbnail: String
    let contents: String
    let publisher: String
    var authorsString: String {
        get {
            var string = ""
            for author in authors{
                string.append(author + " ")
            }
            return string
        }
    }
    var description: String{
        get{
            return "\(authorsString) | \(publisher) | ₩\(price) "
        }
    }
}

class SearchViewController: UIViewController {
    static let identifier = "SearchViewController"
    var pageNum = 1
    let sizeNum = 20
    var searchList = [Book]()

    @IBOutlet var bookSearchBar: UISearchBar!
    
    @IBOutlet var bookTableView: UITableView!
    
//    @IBAction func closeButtonTapped(_ sender: UIButton) {
//        dismiss(animated: true)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        setNavigationBar()
        setSearchBar()
        setDelegate()
    }
    func design(){
        navigationItem.title = "검색"
        bookTableView.rowHeight = 200
        

    }
    func setNavigationBar(){
        let xmark = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain , target: self , action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    func setSearchBar(){
        bookSearchBar.placeholder = "검색어를 입력해주세요"
        bookSearchBar.showsCancelButton = true
        

    }
    func setDelegate(){
        bookSearchBar.delegate = self
        bookTableView.delegate = self
        bookTableView.dataSource = self
        
    }
    @objc
    func closeButtonClicked() {
        dismiss(animated: true)
    }

    func callRequest(word: String,size:Int,page: Int){
        let url = "https://dapi.kakao.com/v3/search/book?query=\(word)&size=\(size)&page=\(page)"
        let header: HTTPHeaders = ["Authorization": APIKeys.kakaoKey]
        
        AF.request(url, method: .get,headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let books = json["documents"].arrayValue
                print("=============\(books)")

                for item in books{
                    let title = item["title"].stringValue
                    var authors = [String]()
                    for author in item["authors"].arrayValue{
                        authors.append(author.stringValue)
                    }
                    let thumbnail = item["thumbnail"].stringValue
                    let contents = item["contents"].stringValue
                    let publisher = item["publisher"].stringValue
                    let price = item["price"].intValue
                    self.searchList.append(Book(title: title, price: price, authors: authors, thumbnail: thumbnail, contents: contents, publisher: publisher))
                    print("====================")
                    print(self.searchList)
                    self.bookTableView.reloadData()

                }

            case .failure(let error):
                print(error)
            }
        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        var word = bookSearchBar.text!
        word = word.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
      callRequest(word: word, size: sizeNum, page: pageNum)
       
        
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        bookSearchBar.text = ""
        }
}
extension SearchViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as? BookTableViewCell else {return UITableViewCell()}
        cell.setData(data: searchList[indexPath.row])
        return cell
    }

}

