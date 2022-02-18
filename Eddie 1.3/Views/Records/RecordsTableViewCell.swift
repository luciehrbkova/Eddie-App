//
//  RecordsTableViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 18/02/2022.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {

    @IBOutlet weak var recordImage: UIImageView!
    @IBOutlet weak var recordTitle: UILabel!
    
    func setRecord(record: Record) {
        recordImage.image = record.image
        recordTitle.text = record.title
    }
    

}
