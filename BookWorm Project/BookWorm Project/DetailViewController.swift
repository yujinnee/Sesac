//
//  DetailViewController.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    static let identifier = "DetailViewController"
    var navigationTitle: String = "타이틀"
    var movie = Movie(title: "", releaseDate: "", runtime: 0, overview: "", rate: 0)

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieRateLabel: UILabel!
    @IBOutlet var movieOverviewTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = navigationTitle
        let chevron = UIImage(named: "chevron.left")
        
//        print(navigationController?.navigationItem)
//        print(navigationItem)
////        print(navigationItem.leftBarButtonItem)
    
        let button = UIBarButtonItem(image: chevron, style: .plain, target: self, action: #selector(previousButtonTapped))
//        let button = UIBarButtonItem(customView: UIImageView(image: chevron))
       
        navigationController?.navigationItem.setLeftBarButton(button, animated: false)
        
//        navigationController!.navigationItem.leftBarButtonItem?.title = ""
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: chevron, style: .plain, target: self, action: #selector(previousButtonTapped))
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: chevron, style: .plain, target: self, action: #selector(previousButtonTapped))
//        print(navigationItem.leftBarButtonItem)
//        navigationItem.leftBarButtonItem?
        navigationItem.leftBarButtonItem?.tintColor = .red
    

        posterImageView.image = UIImage(named: movie.title)
        movieTitleLabel.text = movie.title
        movieRateLabel.text = "평점: \(movie.rate)"
        movieOverviewTextView.text = movie.overview
     

    }
    @objc
    func previousButtonTapped(){
        navigationController?.popViewController(animated: true)
    }

}
