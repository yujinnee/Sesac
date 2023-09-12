//
//  SecondTabbarViewController.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/07/27.
//

import UIKit

class SecondTabbarViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    
    let userdefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let count = userdefaults.integer(forKey: "count")
        resultLabel.text = String(count)

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
