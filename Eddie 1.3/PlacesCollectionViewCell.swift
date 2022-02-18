//
//  PlacesCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 16/02/2022.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    
    func setup(with places: FoodCollection) {
        
        //Food Categories
        foodImage.image = places.foodImage
        foodTitle.text = places.foodTitle
    }
}
