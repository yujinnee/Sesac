//
//  SnapViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/22.
//

import UIKit
import SnapKit

class SnapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var redView = UIView()
        var whiteView = UIView()
        var blueView = UIView()
        var yellowView = UIView()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view)
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.leading.equalTo(view.safeAreaLayoutGuide)
//            make.trailing.equalTo(view.safeAreaLayoutGuide)
//            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
//            make.width.height.equalTo(200)
//            make.height.equalTo(200)
            make.size.equalTo(200)
//            make.centerX.equalTo(view)
//            make.centerY.equalTo(view)
//            make.centerX.centerY.equalTo(view)
            make.center.equalTo(view)
        }
        
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.leading.top.trailing.bottom.equalToSuperview()
            make.edges.equalTo(blueView).offset(50)
        }

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
