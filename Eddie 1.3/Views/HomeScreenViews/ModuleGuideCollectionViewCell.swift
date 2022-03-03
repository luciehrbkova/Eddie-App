//
//  ModuleGuideCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 14/02/2022.
//

import UIKit

class ModuleGuideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moduleGuideLabel: UILabel!
    @IBOutlet weak var moduleGuideIcon: UIImageView!
    
    func setup(with moduleGuides1: ModuleGuide) {
        moduleGuideLabel.text = moduleGuides1.moduleTitle
        moduleGuideIcon.image = moduleGuides1.moduleImage
    }
    
//    
//    @IBAction func goToModulePressed(_sender: Any) {
//        addButtonTapAction?()
//    }
//    
//    var addButtonTapAction : (() -> ())?
}
