//
//  HomeViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/31.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var list: Photo = Photo(total: 0, total_pages: 0, results: [])
    let mainView = HomeView()
    override func loadView() {
        let view = HomeView()
        view.delegate = self
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self,#function)
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
       
        
        APIService.shared.callRequest(query: "sky") { photo in
            guard let photo = photo else {
                print("ALERT ERROR")
                return
            }
            self.list = photo
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
            
        }

    }
    deinit {
        print(self,#function)
    }


}

extension HomeViewController: HomeViewProtocol {
    func didSelectItemAt(indexPath: IndexPath) {
        print(indexPath)
        print("popped")
        navigationController?.popViewController(animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.results.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell()}
        cell.imageView.backgroundColor = .systemBlue
        
        let thumbnail = list.results[indexPath.item].urls.thumb
        
        let url = URL(string: thumbnail) // 링크를 기반으로 이미지를 보여준다? >>> 네트워크 통신임!!!
        
        DispatchQueue.global().async {
            let data =  try! Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: data)
            }
          
        }
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(#function)
        
//       .didSelectItemAt(indexPath: list.results[indexPath.item].urls.thumb)

    }
}

