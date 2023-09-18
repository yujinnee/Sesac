//
//  ToDoTable.swift
//  PhotoGramRealm
//
//  Created by 이유진 on 2023/09/08.
//

import Foundation
import RealmSwift

class ToDoTable: Object {
    @Persisted(primaryKey:  true) var _id: ObjectId //Primary Key
    @Persisted var title: String
    @Persisted var favorite: Bool
    
    //To Many RelationShip
    @Persisted var detail: List<DetailTable>
    
    //To One Relationship
    @Persisted var memo: Memo?
    
    
    convenience init(title: String, favorite: Bool ){
        self.init()
        
        self.title = title
        self.favorite = favorite
    
    }
}
class DetailTable: Object {
    @Persisted(primaryKey:  true) var _id: ObjectId //Primary Key
    @Persisted var detail: String
    @Persisted var deadline: Date
    
    //Inverse Relationship Property (LinkingObjects)
    @Persisted(originProperty: "detail") var mainTodo: LinkingObjects<ToDoTable>
    
    convenience init(detail: String, deadline: Date) {
        self.init()
        
        self.detail = detail
        self.deadline = deadline
    }
    
}


class Memo: EmbeddedObject {
    @Persisted var content: String
    @Persisted var date: Date
    
    convenience init(content: String, date: Date) {
        self.init()
        self.content = content
        self.date = date
    }
}
