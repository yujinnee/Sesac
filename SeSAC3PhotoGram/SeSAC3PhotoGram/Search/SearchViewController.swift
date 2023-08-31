//
//  SearchViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/28.
//

import UIKit

protocol passImageDelegate{
    func receiveImageData(image:UIImage)
}

class SearchViewController: BaseViewController {
    
    var delegate: passImageDelegate?
    
    let mainView = SearchView()
    
    let imageList = ["pencil","star","person","star.fill"]
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(recommendKeywordNotificationObserver(notification: )), name: NSNotification.Name("RecommendKeyword"), object: nil)
        
        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
    }
    
    @objc func recommendKeywordNotificationObserver(notification: NSNotification) {


    }
   
    override func configureView() {
        super.configureView()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
}
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
     
    }
}

extension SearchViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.backgroundColor = .systemBrown
        cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.receiveImageData(image: UIImage(systemName:imageList[indexPath.item] ) ?? UIImage())
        
//        NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil,userInfo: ["name" : imageList[indexPath.item], "sample" : "고래밥" ])
        
        dismiss(animated: true)
    }
}
