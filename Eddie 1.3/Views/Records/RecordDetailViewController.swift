//
//  RecordDetailViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 05/03/2022.
//

import UIKit

class RecordDetailViewController: UIViewController {
    
    
    @IBOutlet var generalView: UIView!
    @IBOutlet weak var detailCategory: UILabel!
    @IBOutlet weak var detailTime: UILabel!
    
    let database = DatabaseManager()
    var receivedData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print(receivedData)
        print(type(of: receivedData))
        
        // Set Database------------------
        database.setDatabase()
        database.readRecordDetail(variable: receivedData)
        populateRecord()
        print("This is test:\(database.testString1)")
        print("This is record in detail on next screen:")
        print(database.recordsInDetail.count
        )
        print(database.recordsInDetail)
        
    }
    
    @IBAction func deleteButtonpressed(_ sender: Any) {
//        database.removeRecord(key: receivedData)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func populateRecord() {
        print(database.recordsInDetail.count)
//        detailTime.text = database.recordsInDetail[0].date
//        detailCategory.text = database.recordsInDetail[0].mealCategory?.itemTitle
    }
}
