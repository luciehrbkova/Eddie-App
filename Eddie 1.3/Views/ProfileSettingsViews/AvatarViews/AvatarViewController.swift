//
//  AvatarViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 14/02/2022.
//

import UIKit

class AvatarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var profileAvatar: UIImageView!
    @IBOutlet weak var avatarCollectionView: UICollectionView!
    
    var receivedData = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        avatarCollectionView.delegate = self
        avatarCollectionView.dataSource = self
        
        avatarCollectionView.layer.cornerRadius = 20
        avatarCollectionView.layer.masksToBounds = true
        
        // Layout (this fix the problem with item sizes)
        avatarCollectionView.collectionViewLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: 96, height: 96)
//            layout.scrollDirection = .horizontal
            return layout
        }()
        print(receivedData)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = avatarCollectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCollectionViewCell", for: indexPath) as! AvatarCollectionViewCell
        cell.setup(with: avatar[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(avatar[indexPath.row])
        profileAvatar.image = avatar[indexPath.row].avatarImage
        // send data to database
    }
    
}


