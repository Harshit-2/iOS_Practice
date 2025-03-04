//
//  ViewController.swift
//  SearchBar
//
//  Created by Harshit ‎ on 2/11/25.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var itemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        let item1 = Item(context: context)
        item1.title = "Buy Milk"
        item1.done = false
        
        let item2 = Item(context: context)
        item2.title = "Eat Shrimps"
        item2.done = false
        
        let item3 = Item(context: context)
        item3.title = "Eat Sweets"
        item3.done = false
        
        let item4 = Item(context: context)
        item4.title = "Buy Bacon"
        item4.done = false
        
        saveItems()
        loadItems()
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        do {
            itemArray = try context.fetch(request)
            
            print("------ Items ------")

            for item in itemArray {
                let title = item.title
                let status = item.done
                print("• \(title!) [\(status)]")
            }
            print("-------------------")
            
        } catch {
            print("Error fetching items: \(error)")
        }
    }

    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving items: \(error)")
        }
    }
}


extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        request.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        loadItems(with: request)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}

