//
//  LunchCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 16/02/2022.
//

import UIKit

class LunchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    
    func setup(with lunchOrDinnerOptions: FoodCollection) {
        
        //Food Categories
        foodImage.image = lunchOrDinnerOptions.foodImage
        foodTitle.text = lunchOrDinnerOptions.foodTitle
    }
    
//    override var isSelected: Bool {
//        didSet {
//            self.alpha = isSelected ? 1 : 0.5
//        }
//    }
    
}
