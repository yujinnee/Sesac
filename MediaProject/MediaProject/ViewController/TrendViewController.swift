//
//  ViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/11.
//

import UIKit

class TrendViewController: BaseViewController{
    var list = TrendModel().videoList

    @IBOutlet var trendVideoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TMDBManager.shared.callTrendRequest(type: Endpoint.trend){ result in

            self.list.append(contentsOf: result)

            self.trendVideoTableView.reloadData()
        }
    }
    
    override func initData() {
        print("data")
    }
    override func initLayout() {
        print("layout")
    }
    
    

}

extension TrendViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrendMovieTableViewCell.identifier, for: indexPath) as? TrendMovieTableViewCell else {return UITableViewCell() }
        cell.setData(video: list[indexPath.row])
        return cell
                
    }

}


