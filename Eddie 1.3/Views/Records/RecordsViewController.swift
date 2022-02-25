//
//  RecordsViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

class RecordsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recordTableView: UITableView!
    

    var records = RecordsDatabase

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordTableView.delegate = self
        recordTableView.dataSource = self

        //remove bottom border
        self.recordTableView.separatorStyle = .none
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = records[indexPath.row]
        let cell = recordTableView.dequeueReusableCell(withIdentifier: "RecordsTableViewCell") as! RecordsTableViewCell
//        cell.recordMealCellImage.image = record.mealCategory?.itemImage
        cell.recordMealCellTitle.text = record.mealCategory?.itemTitle
        cell.recordMealCellNote.text = record.foodNote
        
//        cell.recordMoodCellImage.image = record.mood?.itemImage
        cell.recordMoodCellTitle.text = "Feelings"
        cell.recordMoodCellNote.text = record.moodNote
        
        cell.view1.backgroundColor = UIColor(named: "PeachSecond")
        cell.view2.backgroundColor = UIColor(named: "PeachSecond")
        cell.view3.backgroundColor = UIColor(named: "PeachSecond")
        cell.view4.backgroundColor = UIColor(named: "PeachSecond")
        cell.view1.layer.cornerRadius = 10
        cell.view1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cell.view4.layer.cornerRadius = 10
        cell.view4.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
//        cell.recordCellImage.image = record.image
//        cell.recordCellTitle.text = record.title
//        cell.setRecord(record: record)
        return cell
    }
    

}


