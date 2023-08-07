//
//  ViewController.swift
//  SearchExample
//
//  Created by jack on 2023/08/04.
//
 
import UIKit

class LibraryCollectionViewController: UICollectionViewController {
    
    let searchBar = UISearchBar()
    
    var list = MovieInfo()
    var searchList: [Movie] = []
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchList = list.movie

        configureSearchBar()
        collectionViewLayout()
 
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        
        searchList[sender.tag].like.toggle()
        collectionView.reloadData()
        
        let title  = searchList[sender.tag].title
        
        for (index,item) in list.movie.enumerated() {
            if item.title == title{
                list.movie[index].like.toggle()
            }
        }
        
        
        
    }
     
    func searchQuery(text: String) {
        searchList.removeAll()
        
        for item in list.movie {
            if item.title.contains(text){
                searchList.append(item)
            }
        }

    }

}

extension LibraryCollectionViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        searchQuery(text: text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        searchQuery(text: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList = list.movie
        searchBar.text = ""
        collectionView.reloadData()
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
}

extension LibraryCollectionViewController {
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.movie.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LibraryCollectionViewCell.identifier, for: indexPath) as! LibraryCollectionViewCell
        
        let data = list.movie[indexPath.row]
        cell.configureCell(data: data)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    
}

extension LibraryCollectionViewController {
    
    static let identifier = "LibraryCollectionViewController"
    
    func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 12
        let width = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .white
    }
 
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력해주세요"
        navigationItem.titleView = searchBar
    }
    
}
