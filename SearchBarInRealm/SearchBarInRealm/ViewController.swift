//
//  ViewController.swift
//  QueryingInDatabases
//
//  Created by Harshit ‎ on 2/12/25.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    let realm = try! Realm()
    var peopleArray = [Person] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error)
        }
        
        let person1 = Person()
        person1.name = "Zhao Lusi"
        person1.age = 26
        
        let person2 = Person()
        person2.name = "Kim Ji Won"
        person2.age = 32
        
        let person3 = Person()
        person3.name = "Kim Yoo Jung"
        person3.age = 25
        
        do {
            try realm.write {
                realm.add([person1, person2, person3])
            }
        } catch {
            print(error)
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let results = realm.objects(Person.self)
            .filter("name CONTAINS[cd] %@", searchBar.text!)
            .sorted(byKeyPath: "name", ascending: true)
        
        print(results)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
