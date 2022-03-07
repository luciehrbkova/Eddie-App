//
//  RecordsViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

class RecordsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recordTableView: UITableView!
    let database = DatabaseManager()
    var recordKey = String()
    

//    var records = RecordsDatabase

//    var records = [Record]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordTableView.delegate = self
        recordTableView.dataSource = self

        //remove bottom border
        self.recordTableView.separatorStyle = .none
        
        // Set Database------------------
        database.setDatabase()
        database.readRecords(reloadedTableView: self.recordTableView)
        database.readRemovedRecords(reloadedTableView: self.recordTableView)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return records.count
        print(database.records.count)
        return database.records.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = database.records[indexPath.row]
        let cell = recordTableView.dequeueReusableCell(withIdentifier: "RecordsTableViewCell") as! RecordsTableViewCell
        cell.recordMealCellImage.image = UIImage(named: (record.mealCategory?.itemTitle)!)
//        print(record.mealCategory?.itemImage)
        cell.recordMealCellTitle.text = record.mealCategory?.itemTitle
        cell.recordCellDate.text = record.date
        cell.recordMealCellNote.text = record.foodNote
        cell.recordMoodCellImage.image = UIImage(named: (record.mood?.itemTitle)!)
        cell.recordMoodCellTitle.text = "Feelings"
        cell.recordMoodCellNote.text = record.moodNote
        
        cell.view1.backgroundColor = UIColor.systemBackground
        cell.view2.backgroundColor = UIColor.systemBackground
        cell.view3.backgroundColor = UIColor.systemBackground
        cell.view4.backgroundColor = UIColor.systemBackground
        cell.view1.layer.cornerRadius = 10
        cell.view1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cell.view4.layer.cornerRadius = 10
        cell.view4.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
//        cell.recordCellImage.image = record.image
//        cell.recordCellTitle.text = record.title
//        cell.setRecord(record: record)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recordKey = database.records[indexPath.row].userID
    
//        let viewController = storyboard?.instantiateViewController(withIdentifier: "RecordDetailViewController")
//        database.readDetail()
//        let recordKey = database.displayedRecord
//        print(recordKey)
//
//        let viewController = RecordDetailViewController()
//        viewController.receivedData = recordKey
//        navigationController?.pushViewController(viewController, animated: true)
        
        
    }
    
//     _______Segue settings (target + data)__________________________________________
//     This function is called before the segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecordDetail" {
            // get a reference to the second view controller
            let targetViewController = segue.destination as! RecordDetailViewController
            // set a variable in the second view controller with the data to pass
            print("this is the key")
            print(recordKey)
            targetViewController.receivedData = recordKey

        }
    }

}


