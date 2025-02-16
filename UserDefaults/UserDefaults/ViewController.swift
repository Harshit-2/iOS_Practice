//
//  ViewController.swift
//  UserDefaults
//
//  Created by Harshit ‎ on 2/15/25.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNewItem()
        loadItems()
    }
    
    func addNewItem() {
        defaults.set(0.24, forKey: "Volume")
        defaults.set(true, forKey: "MusicOn")
        defaults.set("Zhao Lusi", forKey: "Person")
        defaults.set(Date(), forKey: "AppLastOpenedByUser")
        
        let array = ["Find Mike", "Buy Eggos", "Destroy Demogorgan"]
        defaults.set(array, forKey: "myArray")
        
        let dictionary = ["name": "Angela"]
        defaults.set(dictionary, forKey: "myDictionary")
    }
    
    func loadItems() {
        let volume = defaults.float(forKey: "Volume")
        let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser") as? Date
        let myArray = defaults.array(forKey: "myArray") as? [String]
        let myDictionary = defaults.dictionary(forKey: "myDictionary")
        print(volume)
        print(appLastOpen!)
        print(myArray!)
        print(myDictionary!)
    }
}
