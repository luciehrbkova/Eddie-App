//
//  TreatsCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 16/02/2022.
//

import UIKit

class TreatsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    
    func setup(with treatsOptions: FoodCollection) {
        
        //Food Categories
        foodImage.image = treatsOptions.foodImage
        foodTitle.text = treatsOptions.foodTitle
    }
    
}
