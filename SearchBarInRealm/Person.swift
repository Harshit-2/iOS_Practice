//
//  Person.swift
//  SearchBar
//
//  Created by Harshit ‎ on 2/11/25.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
