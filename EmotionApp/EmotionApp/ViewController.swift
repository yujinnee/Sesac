//
//  ViewController.swift
//  EmotionApp
//
//  Created by 이유진 on 2023/07/26.
//

import UIKit

class ViewController: UIViewController {
    var emotionScore = [
        "happy":0,
        "notBad":0,
        "soso":0,
        "notGood":0,
        "sad":0
    ]
    

    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        switch sender.tag{
        case emotion.happy.rawValue:
            emotionScore["happy"]! += 1
            print("happy:\(emotionScore["happy"]!)")
        case emotion.notBad.rawValue:
            emotionScore["notBad"]! += 1
            print("notBad:\(emotionScore["notBad"]!)")
        case emotion.soso.rawValue:
            emotionScore["soso"]! += 1
            print("soso:\(emotionScore["soso"]!)")
        case emotion.notGood.rawValue:
            emotionScore["notGood"]! += 1
            print("notGood:\(emotionScore["notGood"]!)")
        case emotion.sad.rawValue:
            emotionScore["sad"]! += 1
            print("sad:\(emotionScore["sad"]!)")
        default:
            return
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

