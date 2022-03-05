//
//  DatabaseManager.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 21/02/2022.
//
struct Post {
    var user: String
    var text: String
}

import Foundation
import FirebaseDatabase

class DatabaseManager {
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    //????????
    var postData = [Post]()
    
    var records = [Record]()
    
    func setDatabase() {
        ref = Database.database().reference()
    }
    
    func readPosts(reloadedTableView: UITableView){
        //Retreive the posts and listen for changes (.childAdded)
        ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            if let  post = snapshot.value as? [String: Any] {
                let user = post["user"] as? String ?? ""
                let text = post["text"] as? String ?? ""
                let actualPost = Post(user: user, text: text)
//                print(user)
//                print(text)
                self.postData.append(actualPost)
                print(actualPost)
                reloadedTableView.reloadData()
            }
        })
       
            
            
//            let post = snapshot.value as? [String: Any] {
//                let user = post["user"] as? String ?? ""
//                let text = post["text"] as? String ?? ""
//            }

//                reloadedTableView.reloadData()

//        })
//        { error in
//          print(error.localizedDescription)
//        }
    }
    
    func readRecords(reloadedTableView: UITableView ){
        //Retreive the posts and listen for changes (.childAdded)
        databaseHandle = ref?.child("Records").observe(.value, with: { (snapshot) in
            // Code to executed when a child is added under "Posts"
            // Tak the value from the snapsot and added it into postData array
            // Try to convert the value of the data to a string
            let value = snapshot.value as? NSDictionary
            let userID = value?["userID"] as? String ?? ""
            let record = Record(userID: userID, date: nil, treatMeal: nil, drink: nil, foodNote: nil, place: nil, mood: nil, reaction: nil, moodNote: nil)
        
//            if let actualRecord = record {
//                //Append data to our post data Array
//                self.records.append(actualRecord)
//                // Reload the table view
                reloadedTableView.reloadData()
            print(userID)
        })
        { error in
          print(error.localizedDescription)
        }
    }
    
    func addPost(user: String, input: String){
        //TODO: Post the data to firebase
        //create automatically child by id
        let object : [String: String] = [
            "user": "lulu",
            "text": input,
        ]
        ref?.child("Posts").childByAutoId().setValue(object)
    }
    
    func addRecord(userID: String,
                   recordDate: String?, recordTime: String?,
                   mealCategoryTitle: String?, mealCategoryImage: String?,
                   breakfastMealTitle: String?, breakfastMealImage: String?,
                   lunchDinMealTitle: String?, lunchDinMealImage: String?,
                   snackMealTitle: String?, snackMealImage: String?,
                   treatMealTitle: String?, treatMealImage: String?,
                   drinkTitle: String?, drinkImage: String?,
                   foodNote: String?,
                   placeTitle: String?, placeImage: String?,
                   moodTitle: String?, moodImage: String?,
                   reactionTitle: String?, reactionImage: String?,
                   moodNote: String?) {
        
        ref?.child("Records").childByAutoId().setValue([
            "userID": userID,
            "date": recordDate!,
            "time": recordTime!,
            "mealCategory" : [  "itemTitle": mealCategoryTitle, "itemImage": mealCategoryImage  ],
            "breakfastMeal" : [ "itemTitle": breakfastMealTitle, "itemImage": breakfastMealImage ],
            "lunchDinnerMeal" : [ "itemTitle": lunchDinMealTitle, "itemImage": lunchDinMealImage ],
            "snackMeal" : [ "itemTitle": snackMealTitle, "itemImage": snackMealImage ],
            "treatMeal" : [ "itemTitle": treatMealTitle, "itemImage": treatMealImage ],
            "drink" : [ "itemTitle": drinkTitle,"itemImage": drinkImage ],
            "foodNote": foodNote ?? "nil" ,
            "place" : [ "itemTitle": placeTitle, "itemImage": placeImage ],
            "mood" : [ "itemTitle": moodTitle, "itemImage": moodImage ],
            "reaction" : [ "itemTitle": reactionTitle, "itemImage": reactionImage ],
            "moodNote": moodNote ?? "nil" ,])
        
        //later use this key to set Status node
//        ref?.child("Records").child(key).child(moodNote).setValue.( /// set the rest of values)
//
    }
    
}
