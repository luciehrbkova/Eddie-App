//
//  SnackCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 16/02/2022.
//

import UIKit

class SnackCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    
    func setup(with snackOptions: FoodCollection) {
        
        //Food Categories
        foodImage.image = snackOptions.foodImage
        foodTitle.text = snackOptions.foodTitle
    }
    
}
