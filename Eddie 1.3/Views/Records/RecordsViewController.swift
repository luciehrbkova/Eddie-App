//
//  RecordsViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

class RecordsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recordTableView: UITableView!
    

    var records = recordsDatabase

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordTableView.delegate = self
        recordTableView.dataSource = self

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = records[indexPath.row]
        let cell = recordTableView.dequeueReusableCell(withIdentifier: "RecordsTableViewCell") as! RecordsTableViewCell
        cell.recordCellImage.image = record.image
        cell.recordCellTitle.text = record.title
//        cell.setRecord(record: record)
        return cell
    }
    

}


