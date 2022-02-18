//
//  AwardsViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

class AwardsViewController: UIViewController {

    
    
    @IBOutlet weak var awardCollectionView: UICollectionView!
    @IBOutlet weak var labelRecent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //declare DataSouce + Delegate
        awardCollectionView.dataSource = self
        awardCollectionView.delegate = self
        
        //style CollectView
        awardCollectionView.layer.cornerRadius = 10
        awardCollectionView.layer.masksToBounds = true

        //style CollectView Layout
        awardCollectionView.collectionViewLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: 72, height: 100)
            layout.scrollDirection = .horizontal
            return layout
        }()

    }
    
}

extension AwardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // returns the number of cells
        return awards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = awardCollectionView.dequeueReusableCell(withReuseIdentifier: "AwardCollectionViewCell", for: indexPath) as! AwardCollectionViewCell
        // returns the cell
        cell.setup(with: awards[indexPath.row])
        return cell
    }
}


extension AwardsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(awards[indexPath.row].awardTitle)
    }
}



