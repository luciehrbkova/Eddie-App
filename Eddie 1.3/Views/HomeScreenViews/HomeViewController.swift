//
//  HomeViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var moduleGuideCollectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        moduleGuideCollectionView.dataSource = self
        moduleGuideCollectionView.delegate = self
    
        //style CollectView
        moduleGuideCollectionView.layer.cornerRadius = 10
        moduleGuideCollectionView.layer.masksToBounds = true
        
        //style CollectView Layout
        moduleGuideCollectionView.collectionViewLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: 90, height: 120)
            layout.scrollDirection = .horizontal
            return layout
        }()
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moduleGuides1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moduleGuideCollectionView.dequeueReusableCell(withReuseIdentifier: "ModuleGuideCollectionViewCell", for: indexPath) as! ModuleGuideCollectionViewCell
        cell.setup(with: moduleGuides1[indexPath.row])
        // style
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        moduleGuides1[indexPath.row].moduleImage = UIImage(systemName: "checkmark.circle")! 
        // send data to database
    }
    

}
