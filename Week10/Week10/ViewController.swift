//
//  ViewController.swift
//  Week10
//
//  Created by 이유진 on 2023/09/19.
//

import UIKit

import Alamofire
import SnapKit
import Kingfisher


class ViewController: UIViewController {
    private lazy var scrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemMint
        view.minimumZoomScale = 1
        view.maximumZoomScale = 5
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        return view
    }()
    
    private let imageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        configureHierarchy()
        configureLayout()
        configureGesture()
        
        viewModel.request { url in
            self.imageView.kf.setImage(with: url)
        }
        
    }
    
    private func configureGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func doubleTapGesture() {
        print(#function)
        if scrollView.zoomScale == 1 {
            scrollView.setZoomScale(2, animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
    
    private func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(300)
        }
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(scrollView)
        }
    }
    
    private func configureHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

struct Photo: Decodable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
}

struct PhotoResult: Decodable {
    let id: String
    let created_at: String
    let urls: PhotoURL
}

struct PhotoURL: Decodable {
    let full: String
    let thumb: String
}
