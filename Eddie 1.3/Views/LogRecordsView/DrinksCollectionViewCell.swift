//
//  DrinksCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 16/02/2022.
//

import UIKit

class DrinksCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    
    func setup(with drinksOptions: FoodCollection) {
        
        //Food Categories
        foodImage.image = drinksOptions.foodImage
        foodTitle.text = drinksOptions.foodTitle
    }
    
}
