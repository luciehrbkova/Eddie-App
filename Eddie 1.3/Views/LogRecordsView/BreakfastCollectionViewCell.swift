//
//  BreakfastCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 16/02/2022.
//

import UIKit

class BreakfastCollectionViewCell: UICollectionViewCell {
    
    //Breakfast Options
    @IBOutlet weak var foodImageBreakfast: UIImageView!
    @IBOutlet weak var foodTitleBreakfast: UILabel!
    
    
    func setup(with breakfastOptions: FoodCollection ) {
        //Breakfast Options
        foodImageBreakfast.image = breakfastOptions.foodImage
        foodTitleBreakfast.text = breakfastOptions.foodTitle
    }
    
}
