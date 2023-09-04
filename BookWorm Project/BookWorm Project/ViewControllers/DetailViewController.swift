//
//  DetailViewController.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit
import Kingfisher


class DetailViewController: UIViewController {
    static let identifier = "DetailViewController"
    var navigationTitle: String = "타이틀"
//    var movie = Movie(title: "", releaseDate: "", runtime: 0, overview: "", rate: 0)
    var book = BookTable(title: "", author: "", thumbnailURL: "", price: 0)
    var viewTransitionType: TransitionType = .push
    let placeholder = "느낀 점을 입력해주세요."

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieRateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var recordTextView: UITextView!
    @IBOutlet var previousButton: UIButton!
    @IBAction func previousButtonClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
        setDelegate()
        setNavigationItem()
        setKeyboardObserver()
    }
    @IBAction func rootViewDidTap(_ sender: Any) {
        view.endEditing(true)
    }
    func designUI() {
        let url = URL(string: book.thumbnailURL)
        posterImageView.kf.setImage(with: url)
//        posterImageView.image = UIImage(named: movie.title)
        movieTitleLabel.text = book.title
        movieRateLabel.text = "가격: \(book.price) 작가: \(book.author)"
        overviewLabel.text = ""
        overviewLabel.numberOfLines = 0
        switch viewTransitionType {
        case .present:
            previousButton.isHidden = false
        case .push:
            previousButton.isHidden = true
        }
        recordTextView.text = placeholder
        recordTextView.textColor = .lightGray
       
        
    }
    func setDelegate() {
        recordTextView.delegate = self
    }
    func setNavigationItem() {
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
    
//        movieOverviewTextView.text = movie.overview
       
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
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
            textView.textColor = .lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            view.endEditing(true)
        }
        return true
    }

    
}

extension DetailViewController {
    
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
          if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                  let keyboardRectangle = keyboardFrame.cgRectValue
                  let keyboardHeight = keyboardRectangle.height
              UIView.animate(withDuration: 1) {
                  self.view.window?.frame.origin.y -= keyboardHeight
              }
          }
      }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.window?.frame.origin.y != 0 {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                    let keyboardRectangle = keyboardFrame.cgRectValue
                    let keyboardHeight = keyboardRectangle.height
                UIView.animate(withDuration: 1) {
                    self.view.window?.frame.origin.y += keyboardHeight
                }
            }
        }
    }
}
