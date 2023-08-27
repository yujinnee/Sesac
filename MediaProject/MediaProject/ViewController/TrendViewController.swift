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
        setDelegate()
        registerCell()
        trendVideoTableView.rowHeight = 400
        TMDBManager.shared.callTrendRequest(){ result in

            self.list.append(contentsOf: result)
            self.trendVideoTableView.reloadData()
        }
        

    }
    
    func registerCell(){
        trendVideoTableView.register(UINib(nibName: TrendMovieTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TrendMovieTableViewCell.identifier)
    }
    func setDelegate(){
        trendVideoTableView.dataSource = self
        trendVideoTableView.delegate = self
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else {return}
        vc.video = list[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


