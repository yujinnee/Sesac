//
//  emotionEnum.swift
//  EmotionApp
//
//  Created by 이유진 on 2023/07/26.
//

import Foundation

enum Emotion: Int {
    case happy = 1
    case notBad
    case soso
    case notGood
    case sad

    var name: String {
        switch self {
        case .happy:
            return "happy"
        case .notBad:
            return "notBad"
        case .soso:
            return "soso"
        case .notGood:
            return "notGood"
        case .sad:
            return "sad"
        }
    }
}
