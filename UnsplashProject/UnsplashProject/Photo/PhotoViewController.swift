//
//  PhotoViewController.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/12.
//

import UIKit
import Kingfisher

class PhotoViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    var viewModel = PhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchPhoto()
        
        viewModel.list.bind { _ in//뷰모델의 리스트 코트가 바뀌면 어떻게 할래?
            DispatchQueue.main.async{
                self.tableView.reloadData()

            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        
       
    }
}
extension PhotoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.list.value.results?.count ?? 0
        return viewModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell")!
        
        let data = viewModel.cellForRowAt(at: indexPath)
        let url = viewModel.cellForRowAtImageUrl(at: indexPath)
        cell.imageView?.kf.setImage(with: url)
    
        cell.backgroundColor = .lightGray
        
        return cell
    }
}
