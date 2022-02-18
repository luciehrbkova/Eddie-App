//
//  AvatarCollectionViewCell.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 14/02/2022.
//

import UIKit

struct Avatar {
    let avatarImage: UIImage
}

let avatar: [Avatar] = [
    Avatar(avatarImage: #imageLiteral(resourceName: "avatar3")),
    Avatar(avatarImage: #imageLiteral(resourceName: "avatar2")),
    Avatar(avatarImage: #imageLiteral(resourceName: "avatar5")),
    Avatar(avatarImage: #imageLiteral(resourceName: "avatar6")),
    Avatar(avatarImage: #imageLiteral(resourceName: "avatar4")),
    Avatar(avatarImage: #imageLiteral(resourceName: "avatar1")),
    Avatar(avatarImage: #imageLiteral(resourceName: "avatar7")),
    Avatar(avatarImage: #imageLiteral(resourceName: "avatar8")),
    Avatar(avatarImage: #imageLiteral(resourceName: "avatar9")),
]

class AvatarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var selectionImageView: UIImageView!
    
    func setup(with avatar: Avatar) {
        selectionImageView.image = avatar.avatarImage
    }
    
    
}
