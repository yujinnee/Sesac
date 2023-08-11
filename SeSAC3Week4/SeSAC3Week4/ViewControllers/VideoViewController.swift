//
//  VideoViewController.swift
//  SeSAC3Week4
//
//  Created by 이유진 on 2023/08/08.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyJSON

struct Video {
    let author: String
    let date: String
    let time: Int
    let thumbnail: String
    let title: String
    let link: String
    
    var contents: String {
        get{
            return "\(author) | \(time)회\n\(date)"
        }
    }
}

class VideoViewController: UIViewController {
    

    var videoList: [Video] = []
    var page = 1
    var isEnd = false

    @IBOutlet var videoTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.prefetchDataSource = self
        searchBar.delegate = self
        
        videoTableView.rowHeight = 130

    }
    

    func callRequest(query: String,page: Int){
        
        KakaoAPIManager.shared.callRequest(type: .video, query: query) { json in
            print(json)
        }
//        print("JSON: \(json)")
//
//                        print(response.response?.statusCode)
//
//                        let statusCode = response.response?.statusCode ?? 500
//
//                        if statusCode == 200 {
//
//                            self.isEnd = json["meta"]["is_end"].boolValue
//
//
//                            for item in json["documents"].arrayValue{
//                                let author = item["author"].stringValue
//                                let date = item["datetime"].stringValue
//                                let time = item["time"].intValue
//                                let thumbnail = item["thumbnail"].stringValue
//                                let title = item["title"].stringValue
//                                let link = item["link"].stringValue
//
//                                let data = Video(author: author, date: date, time: time, thumbnail: thumbnail, title: title, link: link)
//
//                                self.videoList.append(data)
//                                print("======================")
//                                print(self.videoList.count)
//                            }
//                            self.videoTableView.reloadData()
//                        }else {
//                            print("문제가 발생했어요. 잠시후 다시 시도 해주세요!!")
//                        }
    }
}

extension VideoViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        page  = 1
        videoList.removeAll()
        
        guard let query = searchBar.text else {return}
        callRequest(query: query,page:page)
    }
    
}

extension VideoViewController: UITableViewDelegate,UITableViewDataSource,UITableViewDataSourcePrefetching{
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if videoList.count - 1 == indexPath.row && page < 15 && isEnd == false{
                page += 1
                callRequest(query: searchBar.text!, page: page)
            }
        }
    }
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("=====취소: \(indexPaths)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:VideoTableViewCell.identifier) as? VideoTableViewCell else {return UITableViewCell()}
        cell.titleLabel.text = videoList[indexPath.row].title
        cell.contentLabel.text = videoList[indexPath.row].title
        if let url = URL(string: videoList[indexPath.row].thumbnail) {
            cell.thumbnailImageView.kf.setImage(with: url)
        }

        return cell
    }
  
}
