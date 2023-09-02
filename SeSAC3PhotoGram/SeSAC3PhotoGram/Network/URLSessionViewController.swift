//
//  URLSessionViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/30.
//

import UIKit

class URLSessionViewController: UIViewController {
    
    var session: URLSession!
    
    var total: Double = 0
    
    var buffer: Data? {
        didSet {
            let result = Double(buffer?.count ?? 0) / total
            progressLabel.text = "\(result*100)%"
            print(result,total)
        }
    }
    
    let progressLabel = {
        let view = UILabel()
        view.backgroundColor = .black
        view.textColor = .white
        return view
    }()
    
    let imageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        
        buffer = Data()
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")!
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: url).resume()
        
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //취소 액션(화면이 사라질 때 등)
        //리소스 정리, 실행중인 것도 무시
//        session.invalidateAndCancel()
        
        //기다렸다가 리소스 끝나면 정리
//        session.finishTasksAndInvalidate()
        
    }
    
    func setConstraints() {
        view.addSubview(imageView)
        view.addSubview(progressLabel)
        
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(100)
        }
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
    }
    
    
}

extension URLSessionViewController: URLSessionDataDelegate{
    
    //    서버에서 최초로 응답 받은 경우에 호출(상태코드 처리)
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        print("RESPOMSE",response)
        if let response = response as? HTTPURLResponse,(200...500).contains(response.statusCode) {
            total = Double(response.value(forHTTPHeaderField: "Content-Length")!)!
            return .allow
        } else {
            return .cancel
        }
    }
    
    //서버에서 데이터 받을 때마다 반복적으로 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("DATA:", data)
        buffer?.append(data) // buffer가 nil이면 append 구문 실행 X
    }
    //서버에서 응답이 완료가 된 이후에 호출
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("END")
        if let error {
            print(error)
        } else {
            guard let buffer = buffer else {
                print(error)
                return
            }
            
            imageView.image = UIImage(data:buffer)
        }
    }
    
}
