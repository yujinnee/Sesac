//
//  ViewController.swift
//  EmotionApp
//
//  Created by 이유진 on 2023/07/26.
//

import UIKit

class ViewController: UIViewController {
//    var emoticonDictionary = [
//        "happy" : UserDefaults.standard.integer(forKey: "happy"),
//        "notBad": UserDefaults.standard.integer(forKey: "notBad"),
//        "soso": UserDefaults.standard.integer(forKey: "soso"),
//        "notGood": UserDefaults.standard.integer(forKey: "notGood"),
//        "sad":UserDefaults.standard.integer(forKey: "sad")
//    ]
    var emotionDictionary = [String:Int]()
    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        
        guard let emotionCase = Emotion(rawValue: sender.tag) else{return}
        let emotionKey = emotionCase.name
        guard let value = emotionDictionary[emotionKey] else {return}
        emotionDictionary[emotionKey] = value + 1
        UserDefaults.standard.setValue(emotionDictionary, forKey: "emoticonDictionary")
        
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
        
        print("\(emotionKey):\(emotionDictionary[emotionKey] ?? -1)")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initEmotionDictionary()
    }
    
    func initEmotionDictionary() {
        if let userDefaultsData = UserDefaults.standard.dictionary(forKey: "emoticonDictionary") as? [String:Int]{
            emotionDictionary = userDefaultsData
        } else{
            Emotion.allCases.forEach{emotionDictionary.updateValue(0,forKey: $0.name)}
            UserDefaults.standard.setValue(emotionDictionary, forKey: "emoticonDictionary")
        }
    }

}

