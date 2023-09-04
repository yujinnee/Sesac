//
//  lookAroundViewController.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/08/02.
//

import UIKit

class LookAroundViewController: UIViewController {
    var movieList = MovieInfo().movie 
        
    @IBOutlet var recentLabel: UILabel!
    @IBOutlet var lookAroundTableView: UITableView!
    
    @IBOutlet var recentCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setRecentCollectionViewLayout()
        setDelegate()
    }
    func registerCell(){
        var nib = UINib(nibName: RecentCollectionViewCell.identifier, bundle: nil)
        recentCollectionView.register(nib, forCellWithReuseIdentifier:RecentCollectionViewCell.identifier)
        nib = UINib(nibName: HotContentsTableViewCell.identifier, bundle: nil)
        lookAroundTableView.register(nib, forCellReuseIdentifier: HotContentsTableViewCell.identifier)
    }
    
    func setRecentCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 2
    
        recentCollectionView.collectionViewLayout = layout
        
    }
    func setDelegate(){
        recentCollectionView.delegate = self
        recentCollectionView.dataSource = self
        lookAroundTableView.delegate = self
        lookAroundTableView.dataSource = self
    }
    func presentDetailViewController(data: Movie) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
//        vc.movie = data
        vc.viewTransitionType = .present
        present(vc, animated: true)
    }

}


extension LookAroundViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HotContentsTableViewCell.identifier, for: indexPath) as? HotContentsTableViewCell else { return UITableViewCell()}
        cell.configure(movie: movieList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentDetailViewController(data: movieList[indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension LookAroundViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentCollectionViewCell.identifier, for: indexPath) as? RecentCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(movie: movieList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDetailViewController(data: movieList[indexPath.row])
    }
    
}
