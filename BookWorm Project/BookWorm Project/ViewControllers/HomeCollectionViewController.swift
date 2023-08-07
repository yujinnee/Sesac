//
//  HomeCollectionViewController.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

class HomeCollectionViewController: UICollectionViewController {

    var movieList = MovieInfo().movie
    var searchedList = [Movie]() {
        didSet{
            collectionView.reloadData()
        }
    }
    let searchBar = UISearchBar()

    @IBAction func searchButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SearchViewController.identifier)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalTransitionStyle = .coverVertical
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerMovieCollectionViewCell()
        setCollectionViewLayout()
        design()
        initData()
        setDelegate()
        
    }
    func registerMovieCollectionViewCell(){
        let nib = UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
    func design() {
        navigationItem.title = "고래밥님의 책장"
        navigationItem.titleView = searchBar
    }
    func initData(){
        searchedList = movieList
    }
    func setDelegate(){
        searchBar.delegate = self
        
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing*4)
        layout.itemSize = CGSize(width: width/2, height: width/2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell()}
        cell.heartButton.tag = indexPath.row
        cell.heartButton.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        cell.configure(movie: searchedList[indexPath.row])
        return cell
    }
    @objc func heartButtonDidTap(_ sender: UIButton){
        searchedList[sender.tag].favorite.toggle()
        let title = searchedList[sender.tag].title
        for (index,item) in movieList.enumerated(){
            if(item.title == title){
                movieList[index].favorite.toggle()
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var sb = UIStoryboard(name: "Main", bundle: nil)
        var vc = sb.instantiateViewController(identifier: DetailViewController.identifier) as! DetailViewController
        vc.navigationTitle = searchedList[indexPath.row].title
        vc.movie = searchedList[indexPath.row]
        vc.viewTransitionType = .push
        searchBar.endEditing(true)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedList.count
    }
}

extension HomeCollectionViewController:UISearchBarDelegate{
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchingMovie()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingMovie()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchedList = movieList
    }
    
    func searchingMovie(){
        searchedList = [Movie]()
        
        for m in movieList{
            if m.title.contains(searchBar.text!){
                searchedList.append(m)
            }
        }
        if(searchBar.text == ""){
            searchedList = movieList
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
