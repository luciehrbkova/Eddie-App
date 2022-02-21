//
//  DatabaseManager.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 21/02/2022.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    //????????
    var postData = [String]()
    
    func setDatabase() {
        ref = Database.database().reference()
    }
    
    func readPosts(reloadedTableView: UITableView){
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
                reloadedTableView.reloadData()
//                self.tableView.reloadData()
            }
        })
    }
    
    func addPost(input: String){
        //TODO: Post the data to firebase
        //create automatically child by id
        ref?.child("Posts").childByAutoId().setValue(input)
    }
    
}
