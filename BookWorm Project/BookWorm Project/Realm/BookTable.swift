//
//BookTable.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/09/05.
//

import Foundation
import RealmSwift

class BookTable: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String = ""
    @Persisted var author: String = ""
    @Persisted var thumbnailURL: String = ""
    @Persisted var price: Int = 0
    @Persisted var favorite: Bool = false
    
    
    convenience init(title: String, author: String, thumbnailURL: String, price: Int,favorite: Bool) {
        self.init()
        self.title = title
        self.author = author
        self.thumbnailURL = thumbnailURL
        self.price = price
        self.favorite = favorite
    }
    
}
