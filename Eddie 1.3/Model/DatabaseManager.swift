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

var recordsInDetail = [Record]()
var testString1 = String()
var actualRecordDetail = Record(userID: "temporaryUser")

import Foundation
import FirebaseDatabase

class DatabaseManager {
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    //????????
    var postData = [Post]()
    var records = [Record]()
    var displayedRecord = String()
    
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
        { error in
          print(error.localizedDescription)
        }
    }
    
    func readRecords(reloadedTableView: UITableView ){
        ref?.child("Records").observe(.childAdded, with: { (snapshot) in
            if let rrecord = snapshot.value as? [String: Any] {
                let snapshotKey = snapshot.key
                self.displayedRecord = snapshotKey
                let userID = rrecord["userID"] as? String ?? ""
                let date = rrecord["date"] as? String ?? ""
                let time = rrecord["time"] as? String ?? ""
                
                let mealCategory = rrecord["mealCategory"] as? [String:Any]
                let mealCategoryTitle = mealCategory?["itemTitle"] as? String ?? ""
                let breakfastMeal = rrecord["breakfastMeal"] as? [String:Any]
                let breakfastMealTitle = breakfastMeal?["itemTitle"] as? String ?? ""
                let lunchDinnerMeal = rrecord["lunchDinnerMeal"] as? [String:Any]
                let lunchDinnerMealTitle = lunchDinnerMeal?["itemTitle"] as? String ?? ""
                let snackMeal = rrecord["snackMeal"] as? [String:Any]
                let snackMealTitle = snackMeal?["itemTitle"] as? String ?? ""
                let treatMeal = rrecord["treatMeal"] as? [String:Any]
                let treatMealTitle = treatMeal?["itemTitle"] as? String ?? ""
                let drink = rrecord["drink"] as? [String:Any]
                let drinkTitle = drink?["itemTitle"] as? String ?? ""
                
                let foodNote = rrecord["foodNote"] as? String ?? ""
                
                let place = rrecord["place"] as? [String:Any]
                let placeTitle = place?["itemTitle"] as? String ?? ""
                let mood = rrecord["mood"] as? [String:Any]
                let moodTitle = mood?["itemTitle"] as? String ?? ""
                let reaction = rrecord["reaction"] as? [String:Any]
                let reactionTitle = reaction?["itemTitle"] as? String ?? ""
//                let node = snapshot.children.allObjects
//                let childNode = node[0]
                
                let moodNote = rrecord["moodNote"] as? String ?? ""
                let actualRecord = Record(userID: snapshotKey, date: date, time: time,
                                          mealCategory: ItemDetail(itemTitle: mealCategoryTitle, itemImage: mealCategoryTitle),
                                          breakfastMeal: ItemDetail(itemTitle: breakfastMealTitle, itemImage: breakfastMealTitle),
                                          lunchDinMeal: ItemDetail(itemTitle: lunchDinnerMealTitle, itemImage: lunchDinnerMealTitle),
                                          snackMeal: ItemDetail(itemTitle: snackMealTitle, itemImage: snackMealTitle),
                                          treatMeal: ItemDetail(itemTitle: treatMealTitle, itemImage: treatMealTitle),
                                          drink: ItemDetail(itemTitle: drinkTitle, itemImage: drinkTitle),
                                          foodNote: foodNote,
                                          place: ItemDetail(itemTitle: placeTitle, itemImage: placeTitle),
                                          mood: ItemDetail(itemTitle: moodTitle, itemImage: moodTitle),
                                          reaction: ItemDetail(itemTitle: reactionTitle, itemImage: reactionTitle),
                                          moodNote: moodNote)
                self.records.append(actualRecord)
                print(actualRecord)
//                print("This is snap:\(node)")
//                print("This is child:\(childNode)")
                reloadedTableView.reloadData()

            }
        })
        { error in
          print(error.localizedDescription)
        }
        
    }
    
    func readRemovedRecords(reloadedTableView: UITableView ){
        ref?.child("Records").observe(.childRemoved, with: { (snapshot) in
            if let rrecord = snapshot.value as? [String: Any] {
                let snapshotKey = snapshot.key
                self.displayedRecord = snapshotKey
                let userID = rrecord["userID"] as? String ?? ""
                let date = rrecord["date"] as? String ?? ""
                let time = rrecord["time"] as? String ?? ""
                
                let mealCategory = rrecord["mealCategory"] as? [String:Any]
                let mealCategoryTitle = mealCategory?["itemTitle"] as? String ?? ""
                let breakfastMeal = rrecord["breakfastMeal"] as? [String:Any]
                let breakfastMealTitle = breakfastMeal?["itemTitle"] as? String ?? ""
                let lunchDinnerMeal = rrecord["lunchDinnerMeal"] as? [String:Any]
                let lunchDinnerMealTitle = lunchDinnerMeal?["itemTitle"] as? String ?? ""
                let snackMeal = rrecord["snackMeal"] as? [String:Any]
                let snackMealTitle = snackMeal?["itemTitle"] as? String ?? ""
                let treatMeal = rrecord["treatMeal"] as? [String:Any]
                let treatMealTitle = treatMeal?["itemTitle"] as? String ?? ""
                let drink = rrecord["drink"] as? [String:Any]
                let drinkTitle = drink?["itemTitle"] as? String ?? ""
                
                let foodNote = rrecord["foodNote"] as? String ?? ""
                
                let place = rrecord["place"] as? [String:Any]
                let placeTitle = place?["itemTitle"] as? String ?? ""
                let mood = rrecord["mood"] as? [String:Any]
                let moodTitle = mood?["itemTitle"] as? String ?? ""
                let reaction = rrecord["reaction"] as? [String:Any]
                let reactionTitle = reaction?["itemTitle"] as? String ?? ""
//                let node = snapshot.children.allObjects
//                let childNode = node[0]
                
                let moodNote = rrecord["moodNote"] as? String ?? ""
                let actualRecord = Record(userID: snapshotKey, date: date, time: time,
                                          mealCategory: ItemDetail(itemTitle: mealCategoryTitle, itemImage: mealCategoryTitle),
                                          breakfastMeal: ItemDetail(itemTitle: breakfastMealTitle, itemImage: breakfastMealTitle),
                                          lunchDinMeal: ItemDetail(itemTitle: lunchDinnerMealTitle, itemImage: lunchDinnerMealTitle),
                                          snackMeal: ItemDetail(itemTitle: snackMealTitle, itemImage: snackMealTitle),
                                          treatMeal: ItemDetail(itemTitle: treatMealTitle, itemImage: treatMealTitle),
                                          drink: ItemDetail(itemTitle: drinkTitle, itemImage: drinkTitle),
                                          foodNote: foodNote,
                                          place: ItemDetail(itemTitle: placeTitle, itemImage: placeTitle),
                                          mood: ItemDetail(itemTitle: moodTitle, itemImage: moodTitle),
                                          reaction: ItemDetail(itemTitle: reactionTitle, itemImage: reactionTitle),
                                          moodNote: moodNote)
                self.records.append(actualRecord)
                print(actualRecord)
//                print("This is snap:\(node)")
//                print("This is child:\(childNode)")
                reloadedTableView.reloadData()

            }
        })
        { error in
          print(error.localizedDescription)
        }
        
    }
    
    
//    func getKey(){
//        let key = ref?.child("Records").childByAutoId().key
//        displayedRecord = key!
//    }
    
    func readRecordDetail(variable: String, reloadedView: UIView) {
        ref?.child("Records/\(variable)").observe(.value, with:  { snapshot in
            if let rrecord = snapshot.value as? [String: Any] {
                let snapshotKey = snapshot.key
                self.displayedRecord = snapshotKey
                let userID = rrecord["userID"] as? String ?? ""
                let date = rrecord["date"] as? String ?? ""
                let time = rrecord["time"] as? String ?? ""
                
                let mealCategory = rrecord["mealCategory"] as? [String:Any]
                let mealCategoryTitle = mealCategory?["itemTitle"] as? String ?? ""
                let breakfastMeal = rrecord["breakfastMeal"] as? [String:Any]
                let breakfastMealTitle = breakfastMeal?["itemTitle"] as? String ?? ""
                let lunchDinnerMeal = rrecord["lunchDinnerMeal"] as? [String:Any]
                let lunchDinnerMealTitle = lunchDinnerMeal?["itemTitle"] as? String ?? ""
                let snackMeal = rrecord["snackMeal"] as? [String:Any]
                let snackMealTitle = snackMeal?["itemTitle"] as? String ?? ""
                let treatMeal = rrecord["treatMeal"] as? [String:Any]
                let treatMealTitle = treatMeal?["itemTitle"] as? String ?? ""
                let drink = rrecord["drink"] as? [String:Any]
                let drinkTitle = drink?["itemTitle"] as? String ?? ""
                
                let foodNote = rrecord["foodNote"] as? String ?? ""
                
                let place = rrecord["place"] as? [String:Any]
                let placeTitle = place?["itemTitle"] as? String ?? ""
                let mood = rrecord["mood"] as? [String:Any]
                let moodTitle = mood?["itemTitle"] as? String ?? ""
                let reaction = rrecord["reaction"] as? [String:Any]
                let reactionTitle = reaction?["itemTitle"] as? String ?? ""
//                let node = snapshot.children.allObjects
//                let childNode = node[0]
                
                let moodNote = rrecord["moodNote"] as? String ?? ""
                
                let actualRecord = Record(userID: snapshotKey, date: date, time: time,
                                          mealCategory: ItemDetail(itemTitle: mealCategoryTitle, itemImage: mealCategoryTitle),
                                          breakfastMeal: ItemDetail(itemTitle: breakfastMealTitle, itemImage: breakfastMealTitle),
                                          lunchDinMeal: ItemDetail(itemTitle: lunchDinnerMealTitle, itemImage: lunchDinnerMealTitle),
                                          snackMeal: ItemDetail(itemTitle: snackMealTitle, itemImage: snackMealTitle),
                                          treatMeal: ItemDetail(itemTitle: treatMealTitle, itemImage: treatMealTitle),
                                          drink: ItemDetail(itemTitle: drinkTitle, itemImage: drinkTitle),
                                          foodNote: foodNote,
                                          place: ItemDetail(itemTitle: placeTitle, itemImage: placeTitle),
                                          mood: ItemDetail(itemTitle: moodTitle, itemImage: moodTitle),
                                          reaction: ItemDetail(itemTitle: reactionTitle, itemImage: reactionTitle),
                                          moodNote: moodNote)
                actualRecordDetail = actualRecord
//                if self.recordsInDetail.count == 0 {
//                    self.recordsInDetail.append(actualRecord)
//                } else {
//                    self.recordsInDetail[0] = actualRecord
//                }
//                recordsInDetail.append(actualRecord)
                print("This is actual record detail Database")
                print(actualRecordDetail)
//                print("This is list of recordInDetail")
////                print(recordsInDetail)
//                print(recordsInDetail.count)
//                print("This is testString inside database")
//                testString1 = mealCategoryTitle
//                print(testString1)


            }
        })
        { error in
          print(error.localizedDescription)
        }
    }
    
    func removeRecord(key: String) {
        //from some reason it is deleting all posts
        ref?.child("Records/\(key)").removeValue()
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
