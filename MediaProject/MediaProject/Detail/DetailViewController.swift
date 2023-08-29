//
//  DetailViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/13.
//

import UIKit
import Kingfisher

class DetailViewController: BaseViewController {
    private var list = DetailModel().actorList
    var video: Video?
    private var mainView = DetailView()
    
//    @IBOutlet var moreButton: UIButton!
//    @IBOutlet var titleLabel: UILabel!
//    @IBOutlet var posterImageView: UIImageView!
//    @IBOutlet var backdropImageView: UIImageView!
//    @IBOutlet var overviewLabel: UILabel!
//    @IBOutlet var castTableView: UITableView!
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setDelegate()
        
        TMDBManager.shared.callDetailRequest(id: video?.id ?? 0){ result in
            self.list.append(contentsOf: result)
            self.mainView.castTableView.reloadData()
        }
        addTarget()
    }
    
    func addTarget(){
        mainView.moreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
    }
    @objc func moreButtonTapped() {
        guard let vc = storyboard?.instantiateViewController(identifier: MoreViewController.identifier) as? MoreViewController else {return}
        vc.id = video?.id ?? 0
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func configureView() {
        
        mainView.titleLabel.text = video?.title ?? ""
        let posterURL = URL(string: video?.posterURL ?? "" )
        mainView.posterImageView.kf.setImage(with: posterURL)
        let backdropURL = URL(string: video?.imageURL ?? "")
        mainView.backdropImageView.kf.setImage(with: backdropURL)
        mainView.overviewLabel.text = video?.overview ?? ""
        mainView.moreButton.setTitle("more", for: .normal)
    }

    private func setDelegate(){
        mainView.castTableView.dataSource = self
        mainView.castTableView.delegate = self
    }

//    @IBAction func moreButtonTapped(_ sender: UIButton) {
//        guard let vc = storyboard?.instantiateViewController(identifier: MoreViewController.identifier) as? MoreViewController else {return}
//        vc.id = video?.id ?? 0
//        vc.modalTransitionStyle = .coverVertical
//        vc.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
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

