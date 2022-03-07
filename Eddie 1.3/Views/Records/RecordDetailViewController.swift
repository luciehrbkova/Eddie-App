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
        database.readRecordDetail(variable: receivedData, reloadedView: generalView)
        populateRecord()
        print("This is tes of testString t:\(testString1)")
        print("This is record in detail on next screen:")
        print(recordsInDetail.count)
//        print(recordsInDetail)
        
        viewWillAppear(true)
        
    }
    
    @IBAction func deleteButtonpressed(_ sender: Any) {
//        database.removeRecord(key: receivedData)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func populateRecord() {
        print(recordsInDetail.count)
        detailTime.text = actualRecordDetail.date
        detailCategory.text = actualRecordDetail.mealCategory?.itemTitle
    }
}
