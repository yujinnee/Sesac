//
//  ViewController.swift
//  EmotionApp
//
//  Created by 이유진 on 2023/07/26.
//

import UIKit

class ViewController: UIViewController {
    var emoticonDictionary = [
        "happy":0,
        "notBad":0,
        "soso":0,
        "notGood":0,
        "sad":0
    ]
    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        guard let emotionCase = Emotion(rawValue: sender.tag) else{return}
        let emotionKey = emotionCase.name
        guard var value = emoticonDictionary[emotionKey] else {return}
        emoticonDictionary[emotionKey] = value + 1
//
//        switch emotionCase{
//        case .happy:
//            emoticonDictionary[Emotion.happy.name]! += 1
//        case .notBad:
//            emoticonDictionary[Emotion.notBad.name]! += 1
//        case .soso:
//            emoticonDictionary[Emotion.soso.name]! += 1
//        case .notGood:
//            emoticonDictionary[Emotion.notGood.name]! += 1
//        case .sad:
//            emoticonDictionary[Emotion.sad.name]! += 1
//        }
        print("\(emotionKey):\(emoticonDictionary[emotionKey]!)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

