//
//  Item.swift
//  Data Persistance using Realm
//
//  Created by Harshit ‎ on 1/14/25.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items") // Backward Relation with name parentCategory
}
