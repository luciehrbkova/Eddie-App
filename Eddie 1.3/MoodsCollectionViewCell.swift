//
//  MoodsCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 16/02/2022.
//

import UIKit

class MoodsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    
    func setup(with moods: FoodCollection) {
        
        //Food Categories
        foodImage.image = moods.foodImage
        foodTitle.text = moods.foodTitle
    }
}
