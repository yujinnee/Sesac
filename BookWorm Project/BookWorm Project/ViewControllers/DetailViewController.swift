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
    var isModal = false
    let placeholder = "느낀 점을 입력해주세요."

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieRateLabel: UILabel!
//    @IBOutlet var movieOverviewTextView: UITextView!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var recordTextView: UITextView!
    
    @IBOutlet var previousButton: UIButton!
    @IBAction func previousButtonClicked(_ sender: Any) {
        dismiss(animated: true)
    }
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
        overviewLabel.text = movie.overview
        overviewLabel.numberOfLines = 0
//        movieOverviewTextView.text = movie.overview
        previousButton.isHidden = isModal ? false : true
        recordTextView.text = placeholder
        recordTextView.textColor = .lightGray
        recordTextView.delegate = self
//        previousButton.isHidden = presentingViewController?
//        print(self.presentingViewController)
//        print(self.presentedViewController)
//        print(presentationController)
//        pre
//        previousButton.isHidden = prese
        
    }
    @objc
    func previousButtonTapped(){
        navigationController?.popViewController(animated: true)
    }

}

extension DetailViewController: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(recordTextView.text == placeholder){
            textView.text = ""
            textView.textColor = .black
        }
        view.keyboardLayoutGuide.topAnchor.constraint(equalTo: recordTextView.bottomAnchor).isActive = true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
            textView.textColor = .lightGray
        }
    }
    
}
