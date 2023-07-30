//
//  ShoppingStruct.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/30.
//

import Foundation

struct ShoppingItem {
    let name: String
    var isChecked: Bool
    var isLiked: Bool
}
struct ShoppingData {
    var shoppingList = [
        ShoppingItem(name: "그립톡 구매하기", isChecked: true, isLiked: true),
        ShoppingItem(name: "사이다 구매", isChecked: false, isLiked: false),
        ShoppingItem(name: "아이패드 케이스 최저가 알아보기", isChecked: false, isLiked: true),
        ShoppingItem(name: "양말", isChecked: false, isLiked: true)
    ]
}
