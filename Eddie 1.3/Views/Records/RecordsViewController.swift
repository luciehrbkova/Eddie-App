//
//  RecordsViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

class RecordsViewController: UIViewController {
    
    @IBOutlet weak var recordTableView: UITableView!
    var records: [Record] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        records = createArray()
        
        recordTableView.delegate = self
        recordTableView.dataSource = self

    }
    
    func createArray() -> [Record] {
        
        var tempRecords: [Record] = []
        
        let record1 = Record(image: #imageLiteral(resourceName: "Breakfast"), title: "Breakfast")
        let record2 = Record(image: #imageLiteral(resourceName: "Breakfast"), title: "Breakfast")
        let record3 = Record(image: #imageLiteral(resourceName: "Breakfast"), title: "Breakfast")
        let record4 = Record(image: #imageLiteral(resourceName: "Breakfast"), title: "Breakfast")
        
        tempRecords.append(record1)
        tempRecords.append(record2)
        tempRecords.append(record3)
        tempRecords.append(record4)
        
        return tempRecords
    }

}

extension RecordsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = records[indexPath.row]
        let cell = recordTableView.dequeueReusableCell(withIdentifier: "RecordsTableViewCell") as! RecordsTableViewCell
        cell.setRecord(record: record)
        return cell
    }
    
    
}
