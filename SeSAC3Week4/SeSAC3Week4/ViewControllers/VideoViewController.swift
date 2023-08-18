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
        
        KakaoAPIManager.shared.callRequest(type: .video, query: query) { (videoArray,isEnd) in
//            print(json)
            self.isEnd = isEnd
            self.videoList.append(contentsOf: videoArray)
            print(self.videoList)
//            self.videoList = videoArray
            self.videoTableView.reloadData()
        }

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
                print(page)
                callRequest(query: searchBar.text!, page: page)
            }
        }
    }
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
       
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
