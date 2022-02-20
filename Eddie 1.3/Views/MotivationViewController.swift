//
//  MotivationViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit
import FirebaseDatabase

class MotivationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var postData = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set Delegates-----------------
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        // Set Database------------------
        ref = Database.database().reference()
        
        //Retreive the posts and listen for changes (.childAdded)
        databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            // Code to executed when a child is added under "Posts"
            // Tak the value from the snapsot and added it into postData array
            // Try to convert the value of the data to a string
            let post = snapshot.value as? String
            // conditional bonding testing if there is data
            if let actualPost = post {
                //Append data to our post data Array
                self.postData.append(actualPost)
                // Reload the table view
                self.tableView.reloadData()
            }
        })
        
        
        
    }
    
    @IBAction func addPost(_ sender: Any) {
        //TODO: Post the data to firebase
        //create automatically child by id
        if textField.text != "" {
            ref?.child("Posts").childByAutoId().setValue(textField.text)
            print(textField.text!)
            textField.text?.removeAll()
        }
        //dismiss keyboard
        textField.endEditing(true)
    }
    
// TableView Delegates methods-------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        cell.textLabel?.text = postData.reversed()[indexPath.row]
        return cell
    }
    
// TextField Delegates methods-------------------------------------------------
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        print(textField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
}
