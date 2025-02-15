//
//  ViewController.swift
//  Firebase Firestore
//
//  Created by Harshit ‎ on 1/20/25.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var messageTextField: UITextField!
    
//    let messages: [Message] = [
//        Message(sender: "Angela", body: "Hiya"),
//        Message(sender: "Jack", body: "Hi"),
//        Message(sender: "Angela", body: "Howdy"),
//        Message(sender: "Jack", body: "G8"),
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMessages()
    }
    
    func loadMessages() {
//        Read data
        db.collection("messages").getDocuments { QuerySnapshot, error in // .addSnapshotListener for realtime updated in place of .getDocuments
            if let e = error {
                print("There was an issue retrieving data from firestore. \(e)")
            } else {
                if let snapshotDocuments = QuerySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageBody = data["Message"] as? String {
                            print(messageBody)
                        }
                    }
                }
            }
        }
        
    }

    @IBAction func sendTapped(_ sender: UIButton) {
//        Add data
        if let messageBody = messageTextField.text {
            db.collection("messages").addDocument(data: [
                "Message": messageBody
            ]) { error in
                if let e = error {
                    print("There was an issue saving data to firestore. \(e)")
                } else {
                    print("Successfully saved data.")
                }
            }
        }
    }
    
}

