//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Harshit ‎ on 2/9/25.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var itemArray = [Item] ()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        let item1 = Item(context: context)  // C
        item1.title = "Buy Bath and Body Works perfume"
        item1.done = false
        
        let item2 = Item(context: context)
        item2.title = "Buy Body Charm Seduction perfume"
        item2.done = false
        saveItems()
        
        updateItem(item: item1)
        
        deleteItem(item: item2)
        
        loadItems()
    }
    
    func loadItems() {  // R
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            itemArray = try context.fetch(request)
            print(itemArray)
        } catch {
            print("Error fetching data from context \(error)")
        }
        saveItems()
    }
    
    func updateItem(item: Item) {  // U
        item.done = !item.done
        saveItems()
    }
    
    func deleteItem(item: Item) {   // D
        context.delete(item)
        saveItems()
    }
    
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    
}

