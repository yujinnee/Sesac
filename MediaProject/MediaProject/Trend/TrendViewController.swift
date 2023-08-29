//
//  ViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/11.
//

import UIKit

class TrendViewController: BaseViewController{
    var list = TrendModel().videoList

//    @IBOutlet var trendVideoTableView: UITableView!
    let mainView = TrendView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        fetchData()
        
    }
    
    override func configureView() {
        mainView.trendVideoTableView.rowHeight = 400
    }
    func setDelegate(){
        mainView.trendVideoTableView.dataSource = self
        mainView.trendVideoTableView.delegate = self
    }
    func fetchData(){
        TMDBManager.shared.callTrendRequest(){ result in
            self.list.append(contentsOf: result)
            self.mainView.trendVideoTableView.reloadData()
        }
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
        print("ddddd")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else {return}
        vc.video = list[indexPath.row]
        print(navigationController)
        navigationController?.pushViewController(vc, animated: true)
    }
}


