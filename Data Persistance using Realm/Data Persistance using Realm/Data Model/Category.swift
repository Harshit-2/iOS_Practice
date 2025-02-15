//
//  Data.swift
//  Data Persistance using Realm
//
//  Created by Harshit ‎ on 1/14/25.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()    // Forward Realtion
}
