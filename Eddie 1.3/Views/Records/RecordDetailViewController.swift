//
//  RecordDetailViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 05/03/2022.
//

import UIKit

class RecordDetailViewController: UIViewController {
    
    let database = DatabaseManager()
    @IBOutlet weak var detailCategory: UILabel!
    var receivedData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print(receivedData)
        print(type(of: receivedData))
        
        // Set Database------------------
        database.setDatabase()
        database.readRecordDetail(variable: receivedData)
////        database.readRecordDetail()
//
//        detailCategory.text = database.recordInDetail.foodNote
//        print(database.recordInDetail)
        
    }
    

}
