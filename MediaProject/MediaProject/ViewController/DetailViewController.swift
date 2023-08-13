//
//  DetailViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/13.
//

import UIKit
import Kingfisher

class DetailViewController: BaseViewController {
    var list = DetailModel().actorList
    var video: Video?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var backdropImageView: UIImageView!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var castTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setDelegate()
        castTableView.rowHeight = 120
        TMDBManager.shared.callDetailRequest(id: video?.id ?? 0){ result in
            self.list.append(contentsOf: result)
            self.castTableView.reloadData()
            
        }

    }
    
    override func initData() {
        
        titleLabel.text = video?.title ?? ""
        let posterURL = URL(string: video?.posterURL ?? "" )
        posterImageView.kf.setImage(with: posterURL)
        let backdropURL = URL(string: video?.imageURL ?? "")
        backdropImageView.kf.setImage(with: backdropURL)
        overviewLabel.text = video?.overview ?? ""
        
    }
    override func initLayout() {
      
    }
    func registerCell(){
        castTableView.register(UINib(nibName: PersonTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
    func setDelegate(){
        castTableView.dataSource = self
        castTableView.delegate = self
    }

}

extension DetailViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell else {return UITableViewCell() }
        cell.setData(people: list[indexPath.row])
        return cell
                
    }
  
}

