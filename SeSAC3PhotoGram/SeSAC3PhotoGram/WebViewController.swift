//
//  WebViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKUIDelegate {

    var webView = WKWebView()
    
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(100)
        }
        
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        navigationController?.navigationBar.isTranslucent = false // 네비게이션 바 밑에서부터 웹뷰 화면이 시작 되도록
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        
        title = "이건 웹뷰 입니다"
        
    }
    
    func reloadButtonClicked() {
        webView.reload()
    }
    func goBackButtonClicked() {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    func goForwardButtonClicked() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}
