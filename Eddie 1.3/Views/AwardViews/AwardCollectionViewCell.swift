//
//  AwardCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

class AwardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var awardImageView: UIImageView!
    @IBOutlet weak var awardDateLabel: UILabel!
    
    func setup(with award: Award) {
        awardImageView.image = award.awardImage
        awardDateLabel.text = award.awardTitle
    }
}
