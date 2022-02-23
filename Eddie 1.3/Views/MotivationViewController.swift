//
//  MotivationViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit
//import FirebaseDatabase

class MotivationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let database = DatabaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set Delegates-----------------
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        // Set Database------------------
        database.setDatabase()
        database.readPosts(reloadedTableView: self.tableView)
        
    }
    
    @IBAction func addPost(_ sender: Any) {
        if textField.text != "" {
            database.addPost(input: textField.text!)
            print(textField.text!)
            textField.text?.removeAll()
        }
        //dismiss keyboard
        textField.endEditing(true)
    }
    
// TableView Delegates methods-------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        database.postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        cell.textLabel?.text = database.postData.reversed()[indexPath.row]
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
}
