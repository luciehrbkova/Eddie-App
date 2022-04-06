//
//  RecordDetailViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 05/03/2022.
//

import UIKit

class RecordDetailViewController: UIViewController {
    
    
    @IBOutlet var generalView: UIView!
    @IBOutlet weak var detailCategory: UILabel!
    @IBOutlet weak var detailCategoryImage: UIImageView!
    
    @IBOutlet weak var detailFirstMeal: UILabel!
    @IBOutlet weak var detailFirstMealImage: UIImageView!
    @IBOutlet weak var detailSecondMeal: UILabel!
    @IBOutlet weak var detailSecondMealImage: UIImageView!
    @IBOutlet weak var detailDrink: UILabel!
    @IBOutlet weak var detailDrinkImage: UIImageView!
    
    @IBOutlet weak var detailFoodnote: UILabel!
    
    @IBOutlet weak var detailMood: UILabel!
    @IBOutlet weak var detailMoodImage: UIImageView!
    @IBOutlet weak var detailReaction: UILabel!
    @IBOutlet weak var detailReactionImage: UIImageView!
    
    @IBOutlet weak var detailMoodnote: UILabel!
    
    @IBOutlet weak var detailPlace: UILabel!
    @IBOutlet weak var detailPlaceImage: UIImageView!
    
    @IBOutlet weak var detailTime: UILabel!
    
    
    let database = DatabaseManager()
    var receivedData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print(receivedData)
        print(type(of: receivedData))
        
        // Set Database------------------
        database.setDatabase()
        database.readRecordDetail(variable: receivedData, reloadedView: generalView)
        populateRecord()
        print("This is tes of testString t:\(testString1)")
        print("This is record in detail on next screen:")
        print(recordsInDetail.count)
//        print(recordsInDetail)
        
        viewWillAppear(true)
        
    }
    
    @IBAction func deleteButtonpressed(_ sender: Any) {
//        database.removeRecord(key: receivedData)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func populateRecord() {
//        print(recordsInDetail.count)
        detailCategory.text = actualRecordDetail.mealCategory?.itemTitle
        detailCategoryImage.image = UIImage(named: actualRecordDetail.mealCategory?.itemTitle ?? "Breakfast")
        let category =  actualRecordDetail.mealCategory?.itemTitle
        if (category == "Breakfast") {
            // breakfast + snack
            detailFirstMeal.text = actualRecordDetail.breakfastMeal?.itemTitle
            detailFirstMealImage.image =  UIImage(named: actualRecordDetail.breakfastMeal?.itemTitle ?? "Fruit")
            detailSecondMeal.text = actualRecordDetail.snackMeal?.itemTitle
            detailSecondMealImage.image = UIImage(named: actualRecordDetail.snackMeal?.itemTitle ?? "Snack")
        } else if (category == "Lunch") {
            // lunch + treat
            detailFirstMeal.text = actualRecordDetail.lunchDinMeal?.itemTitle
            detailFirstMealImage.image =  UIImage(named: actualRecordDetail.lunchDinMeal?.itemTitle ?? "Fruit")
            detailSecondMeal.text = actualRecordDetail.treatMeal?.itemTitle
            detailSecondMealImage.image = UIImage(named: actualRecordDetail.treatMeal?.itemTitle ?? "Cake")
        } else if (category == "Dinner") {
            // dinner + treat
            detailFirstMeal.text = actualRecordDetail.lunchDinMeal?.itemTitle
            detailFirstMealImage.image =  UIImage(named: actualRecordDetail.lunchDinMeal?.itemTitle ?? "Fruit")
            detailSecondMeal.text = actualRecordDetail.treatMeal?.itemTitle
            detailSecondMealImage.image = UIImage(named: actualRecordDetail.treatMeal?.itemTitle ?? "Cake")
        } else if (category == "Snack") {
            // snack + treat
            detailFirstMeal.text = actualRecordDetail.snackMeal?.itemTitle
            detailFirstMealImage.image = UIImage(named: actualRecordDetail.snackMeal?.itemTitle ?? "Snack")
            detailSecondMeal.text = actualRecordDetail.treatMeal?.itemTitle
            detailSecondMealImage.image = UIImage(named: actualRecordDetail.treatMeal?.itemTitle ?? "Cake")
        } else if (category == "Other") {
            // snack + treat
            detailFirstMeal.text = actualRecordDetail.snackMeal?.itemTitle
            detailFirstMealImage.image = UIImage(named: actualRecordDetail.snackMeal?.itemTitle ?? "Snack")
            detailSecondMeal.text = actualRecordDetail.treatMeal?.itemTitle
            detailSecondMealImage.image = UIImage(named: actualRecordDetail.treatMeal?.itemTitle ?? "Cake")
        } else {
            //none
            detailFirstMeal.text = .none
            detailFirstMealImage.image = .none
            detailSecondMeal.text = .none
            detailSecondMealImage.image = .none
            
        }
        detailDrink.text = actualRecordDetail.drink?.itemTitle
        detailDrinkImage.image = UIImage(named: actualRecordDetail.drink?.itemTitle ?? "Tea")
        
        detailFoodnote.text = actualRecordDetail.foodNote
        
        detailMood.text = actualRecordDetail.mood?.itemTitle
        detailMoodImage.image = UIImage(named: actualRecordDetail.mood?.itemTitle ?? "Happy")
        detailReaction.text = actualRecordDetail.reaction?.itemTitle
        detailReactionImage.image = UIImage(named: actualRecordDetail.reaction?.itemTitle ?? "")
        
        detailMoodnote.text = actualRecordDetail.moodNote
        
        detailPlace.text = actualRecordDetail.place?.itemTitle
        detailPlaceImage.image = UIImage(named: actualRecordDetail.place?.itemTitle ?? "")
    
        detailTime.text = actualRecordDetail.date
    }
}
