//
//  LogViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

class LogViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    // all CollectViews
    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    @IBOutlet weak var breakfastOptionsCollectionView: UICollectionView!
    @IBOutlet weak var lunchOptionsCollectionView: UICollectionView!
    @IBOutlet weak var snackOptionsCollectionView: UICollectionView!
    @IBOutlet weak var treatsOptionsCollectionView: UICollectionView!
    @IBOutlet weak var drinksOptionsCollectionView: UICollectionView!
    @IBOutlet weak var placesCollectionView: UICollectionView!
    @IBOutlet weak var moodCollectionView: UICollectionView!
    @IBOutlet weak var reactionCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //declare DataSouce + Delegate
        foodCategoryCollectionView.dataSource = self
        foodCategoryCollectionView.delegate = self
        breakfastOptionsCollectionView.dataSource = self
        breakfastOptionsCollectionView.delegate = self
        lunchOptionsCollectionView.dataSource = self
        lunchOptionsCollectionView.delegate = self
        snackOptionsCollectionView.dataSource = self
        snackOptionsCollectionView.delegate = self
        treatsOptionsCollectionView.dataSource = self
        treatsOptionsCollectionView.delegate = self
        drinksOptionsCollectionView.dataSource = self
        drinksOptionsCollectionView.delegate = self
        placesCollectionView.dataSource = self
        placesCollectionView.delegate = self
        moodCollectionView.dataSource = self
        moodCollectionView.delegate = self
        reactionCollectionView.dataSource = self
        reactionCollectionView.delegate = self
        
        

        //style CollectView Layout
        styleCollectionViewLayout(collectionView: foodCategoryCollectionView)
        styleCollectionViewLayout(collectionView: breakfastOptionsCollectionView)
        styleCollectionViewLayout(collectionView: lunchOptionsCollectionView)
        styleCollectionViewLayout(collectionView: snackOptionsCollectionView)
        styleCollectionViewLayout(collectionView: treatsOptionsCollectionView)
        styleCollectionViewLayout(collectionView: drinksOptionsCollectionView)
        styleCollectionViewLayout(collectionView: placesCollectionView)
        styleCollectionViewLayout(collectionView: moodCollectionView)
        styleCollectionViewLayout(collectionView: reactionCollectionView)

        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.foodCategoryCollectionView {
            return foodCategories.count
        } else if collectionView == self.breakfastOptionsCollectionView {
            return breakfastOptions.count
        } else if collectionView == self.lunchOptionsCollectionView {
            return lunchOrDinnerOptions.count
        } else if collectionView == self.snackOptionsCollectionView {
            return snackOptions.count
        } else if collectionView == self.treatsOptionsCollectionView {
            return treatsOptions.count
        } else if collectionView == self.drinksOptionsCollectionView {
            return drinksOptions.count
        } else if collectionView == self.placesCollectionView {
            return places.count
        } else if collectionView == self.moodCollectionView {
            return moods.count
        } else if collectionView == self.reactionCollectionView {
            return reactions.count
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.foodCategoryCollectionView {
            let cell = foodCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "LogCollectionViewCell", for: indexPath) as! LogCollectionViewCell
            cell.setup(with: foodCategories[indexPath.row])
            return cell
        } else if collectionView == self.breakfastOptionsCollectionView {
            let cell = breakfastOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "BreakfastCollectionViewCell", for: indexPath) as! BreakfastCollectionViewCell
            cell.setup(with: breakfastOptions[indexPath.row])
            return cell
            
        } else if collectionView == self.lunchOptionsCollectionView {
            let cell = lunchOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "LunchCollectionViewCell", for: indexPath) as! LunchCollectionViewCell
            cell.setup(with: lunchOrDinnerOptions[indexPath.row])
            return cell
        } else if collectionView == self.snackOptionsCollectionView {
            let cell = snackOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "SnackCollectionViewCell", for: indexPath) as! SnackCollectionViewCell
            cell.setup(with: snackOptions[indexPath.row])
            return cell
        } else if collectionView == self.treatsOptionsCollectionView {
            let cell = treatsOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "TreatsCollectionViewCell", for: indexPath) as! TreatsCollectionViewCell
            cell.setup(with: treatsOptions[indexPath.row])
            return cell
        } else if collectionView == self.drinksOptionsCollectionView {
            let cell = drinksOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "DrinksCollectionViewCell", for: indexPath) as! DrinksCollectionViewCell
            cell.setup(with: drinksOptions[indexPath.row])
            return cell
            
        } else if collectionView == self.placesCollectionView {
            let cell = placesCollectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCollectionViewCell", for: indexPath) as! PlacesCollectionViewCell
            cell.setup(with: places[indexPath.row])
            return cell
        } else if collectionView == self.moodCollectionView {
            let cell = moodCollectionView.dequeueReusableCell(withReuseIdentifier: "MoodsCollectionViewCell", for: indexPath) as! MoodsCollectionViewCell
            cell.setup(with: moods[indexPath.row])
            return cell
        } else if collectionView == self.reactionCollectionView {
            let cell = reactionCollectionView.dequeueReusableCell(withReuseIdentifier: "ReactionsCollectionViewCell", for: indexPath) as! ReactionsCollectionViewCell
            cell.setup(with: reactions[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.foodCategoryCollectionView {
            print(foodCategories[indexPath.row].foodTitle)
        } else if collectionView == self.breakfastOptionsCollectionView {
            print(breakfastOptions[indexPath.row].foodTitle)
        } else if collectionView == self.lunchOptionsCollectionView {
            print(lunchOrDinnerOptions[indexPath.row].foodTitle)
        } else if collectionView == self.snackOptionsCollectionView {
            print(snackOptions[indexPath.row].foodTitle)
        } else if collectionView == self.treatsOptionsCollectionView {
            print(treatsOptions[indexPath.row].foodTitle)
        } else if collectionView == self.drinksOptionsCollectionView {
            print(drinksOptions[indexPath.row].foodTitle)
        } else if collectionView == self.placesCollectionView {
            print( places[indexPath.row].foodTitle)
        } else if collectionView == self.moodCollectionView {
            print(moods[indexPath.row].foodTitle)
        } else if collectionView == self.reactionCollectionView {
            print(reactions[indexPath.row].foodTitle)
        }
    }
    
    
    //STYLE COLLECTION VIEWS___________________________________________
    func styleCollectionViewLayout(collectionView: UICollectionView) {
        //round Corners
        collectionView.layer.cornerRadius = 10
        collectionView.layer.masksToBounds = true
        
        collectionView.backgroundColor = .systemBackground
        
        collectionView.collectionViewLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            layout.itemSize = CGSize(width: 60, height: 88)
            layout.scrollDirection = .horizontal
            return layout
        }()
    }
    
}
