//
//  LogCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 15/02/2022.
//

import UIKit

class LogCollectionViewCell: UICollectionViewCell {
    
    //Food Categories
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!


    func setup(with foodCategories: FoodCollection) {
        
        //Food Categories
        foodImage.image = foodCategories.foodImage
        foodTitle.text = foodCategories.foodTitle
    }
    
}
