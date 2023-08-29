//
//  ViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/11.
//

import UIKit

class TrendViewController: BaseViewController{
    private var list = TrendModel().videoList

//    @IBOutlet var trendVideoTableView: UITableView!
    private let mainView = TrendView()
    
//    let profileButton = {
//        let view = UIButton()
//        view.imageView?.image = UIImage(systemName: "person")
//        return view
//    }
    
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(profileButtonTapped))
        
    }
    @objc private func profileButtonTapped(){
        
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
                                                
                                                            
                                                        
    private func setDelegate(){
        mainView.trendVideoTableView.dataSource = self
        mainView.trendVideoTableView.delegate = self
    }
    private func fetchData(){
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


