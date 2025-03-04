//
//  ViewController.swift
//  Alerts
//
//  Created by Harshit ‎ on 3/5/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Category", message: "Enter the new category here", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { action in
            // what will happen when the user clicks the Add button on our UIAlert
            print("Success")
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

