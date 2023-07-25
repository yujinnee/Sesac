//
//  LifeCycleViewController.swift
//  SeSACWeek2
//
//  Created by 이유진 on 2023/07/25.
//

import UIKit

class LifeCycleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("LifeCycleViewController",#function)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("LifeCycleViewController",#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("LifeCycleViewController",#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("LifeCycleViewController",#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("LifeCycleViewController",#function)
    }
    
    


}
