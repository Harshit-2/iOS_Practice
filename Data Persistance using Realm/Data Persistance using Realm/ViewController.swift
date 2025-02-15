//
//  ViewController.swift
//  Data Persistance using Realm
//
//  Created by Harshit ‎ on 1/14/25.
//
//  Implementing CRUD in Realm

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm: Realm
        do {
            realm = try Realm()
        } catch {
            print("Error initializing Realm: \(error)")
            return
        }
        
        let category = Category()
        category.name = "Household"
        
        let item = Item()
        item.title = "Dishwasher"
        
        do {    // To add data in Realm (Create)
            try realm.write {
                realm.add(category)
                realm.add(item)
            }
        } catch {
            print("Error writing to Realm: \(error)")
        }
        
        // Read data from Realm (Read)
        let viewCategory = realm.objects(Category.self)
        print("Fetched Categories: \(viewCategory)")
        
        let viewItem = realm.objects(Item.self)
        print("Fetched Categories: \(viewItem)")
        
        // Update data in Realm (Update)
        do {
            try realm.write {
                item.done = !item.done
            }
        } catch {
            print("Error updating Realm: \(error)")
        }
        
        // Perform Delete in Realm (Delete)
        do {
            try realm.write {
                realm.delete(item)
            }
        } catch {
            print("Error deleting Realm: \(error)")
        }
        
//        toDoItems = toDoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(using: "dateCreated", ascending: true) // to filter
        
    }
    
    
}
