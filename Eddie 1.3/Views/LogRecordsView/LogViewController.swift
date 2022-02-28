//
//  LogViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

// "#imageLiteral(resourceName: 'Breakfast')"
let user = User(email: "luca@gmail.com", username: "Lucie", password: "pass")

var record = Record(userID: user.userID,
                    date: nil, time: nil,
                    mealCategory: ItemDetail(itemTitle: nil, itemImage: nil),
                    breakfastMeal: ItemDetail(itemTitle: nil, itemImage: nil),
                    lunchDinMeal: ItemDetail(itemTitle: nil, itemImage: nil),
                    snackMeal: ItemDetail(itemTitle: nil, itemImage: nil),
                    treatMeal: ItemDetail(itemTitle: nil, itemImage: nil),
                    drink: ItemDetail(itemTitle: nil, itemImage: nil),
                    foodNote: nil,
                    place: ItemDetail(itemTitle: nil, itemImage: nil),
                    mood: ItemDetail(itemTitle: nil, itemImage: nil),
                    reaction: ItemDetail(itemTitle: nil, itemImage: nil),
                    moodNote: nil)

class LogViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var textFieldFood: UITextField!
    @IBOutlet weak var textFieldMood: UITextField!
    @IBOutlet var generalView: UIView!
    
    let database = DatabaseManager()
    
    var time = String()
    var date = String()
    var currentCategory: String? = ""
    var currentBreakfast: String? = ""
    var currentLunch: String? = ""
    var currentSnack: String? = ""
    var currentTreat: String? = ""
    var currentDrink: String? = ""
    var currentPlace: String? = ""
    var currentMood: String? = ""
    var currentReaction: String? = ""
    
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
        
        let cvArray = [foodCategoryCollectionView,
                       breakfastOptionsCollectionView,
                       lunchOptionsCollectionView,
                       snackOptionsCollectionView,
                       treatsOptionsCollectionView,
                       drinksOptionsCollectionView,
                       placesCollectionView,
                       moodCollectionView,
                       reactionCollectionView ]
        
        //declare DataSouce + Delegate & style CollectView Layout
        for cv in cvArray {
            declareDelegateAndDataSource(cv: cv!)
            //style CollectView Layout
            styleCollectionViewLayout(collectionView: cv!)
        }
        // textFields
        textFieldFood.delegate = self
        textFieldMood.delegate = self
        
        // Set Database------------------
        database.setDatabase()
        
    }
    
    func readTime(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        record.date = formatter.string(from: sender.date)
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        record.time = formatter.string(from: sender.date)
    }

    @IBAction func logButton(_ sender: Any) {
        textFieldFood.endEditing(true)
        
        textFieldMood.endEditing(true)
        if (textFieldFood.text != "") {
            record.foodNote = textFieldFood.text
        }
        if (textFieldMood.text != "") {
            record.moodNote = textFieldMood.text
        }
        readTime(sender: timePicker)
        database.addRecord(userID: record.userID,
                           recordDate: record.date, recordTime: record.time,
                           mealCategoryTitle: record.mealCategory?.itemTitle, mealCategoryImage: record.mealCategory?.itemImage,
                           breakfastMealTitle: record.breakfastMeal?.itemTitle, breakfastMealImage: record.breakfastMeal?.itemImage,
                           lunchDinMealTitle: record.lunchDinMeal?.itemTitle, lunchDinMealImage: record.lunchDinMeal?.itemImage,
                           snackMealTitle: record.snackMeal?.itemTitle, snackMealImage: record.snackMeal?.itemImage,
                           treatMealTitle: record.treatMeal?.itemTitle, treatMealImage: record.treatMeal?.itemImage,
                           drinkTitle: record.drink?.itemTitle, drinkImage: record.drink?.itemImage,
                           foodNote: record.foodNote,
                           placeTitle: record.place?.itemTitle, placeImage: record.place?.itemImage,
                           moodTitle: record.mood?.itemTitle, moodImage: record.mood?.itemImage,
                           reactionTitle: record.reaction?.itemTitle, reactionImage: record.reaction?.itemImage,
                           moodNote: record.moodNote)
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
//        super.viewWillAppear(true)
    }
    
    func declareDelegateAndDataSource(cv: UICollectionView){
        cv.dataSource = self
        cv.delegate = self
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.foodCategoryCollectionView :
            return foodCategories.count
        case self.breakfastOptionsCollectionView:
            return breakfastOptions.count
        case self.lunchOptionsCollectionView:
            return lunchOrDinnerOptions.count
        case self.snackOptionsCollectionView :
            return snackOptions.count
        case self.treatsOptionsCollectionView:
            return treatsOptions.count
        case self.drinksOptionsCollectionView:
            return drinksOptions.count
        case self.placesCollectionView:
            return places.count
        case self.moodCollectionView:
            return moods.count
        case self.reactionCollectionView:
            return reactions.count
        default:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case self.foodCategoryCollectionView :
            let cell = foodCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "LogCollectionViewCell", for: indexPath) as! LogCollectionViewCell
            cell.setup(with: foodCategories[indexPath.row])
            return cell
        case self.breakfastOptionsCollectionView:
            let cell = breakfastOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "BreakfastCollectionViewCell", for: indexPath) as! BreakfastCollectionViewCell
            cell.setup(with: breakfastOptions[indexPath.row])
            return cell
        case self.lunchOptionsCollectionView:
            let cell = lunchOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "LunchCollectionViewCell", for: indexPath) as! LunchCollectionViewCell
            cell.setup(with: lunchOrDinnerOptions[indexPath.row])
            return cell
        case self.snackOptionsCollectionView :
            let cell = snackOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "SnackCollectionViewCell", for: indexPath) as! SnackCollectionViewCell
            cell.setup(with: snackOptions[indexPath.row])
            return cell
        case self.treatsOptionsCollectionView:
            let cell = treatsOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "TreatsCollectionViewCell", for: indexPath) as! TreatsCollectionViewCell
            cell.setup(with: treatsOptions[indexPath.row])
            return cell
        case self.drinksOptionsCollectionView:
            let cell = drinksOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "DrinksCollectionViewCell", for: indexPath) as! DrinksCollectionViewCell
            cell.setup(with: drinksOptions[indexPath.row])
            return cell
        case self.placesCollectionView:
            let cell = placesCollectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCollectionViewCell", for: indexPath) as! PlacesCollectionViewCell
            cell.setup(with: places[indexPath.row])
            return cell
        case self.moodCollectionView:
            let cell = moodCollectionView.dequeueReusableCell(withReuseIdentifier: "MoodsCollectionViewCell", for: indexPath) as! MoodsCollectionViewCell
            cell.setup(with: moods[indexPath.row])
            return cell
        case self.reactionCollectionView:
            let cell = reactionCollectionView.dequeueReusableCell(withReuseIdentifier: "ReactionsCollectionViewCell", for: indexPath) as! ReactionsCollectionViewCell
            cell.setup(with: reactions[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        func cellSelectionFeedback(cv: UICollectionView, collection: [FoodCollection], actualValue: inout String?) {
            let cell : UICollectionViewCell = cv.cellForItem(at: indexPath)!
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            if collection[indexPath.row].foodTitle == actualValue {
                cell.backgroundColor = .systemBackground
                actualValue = "nil"
                print(actualValue)
            } else {
                cell.backgroundColor = .systemGray6
                actualValue = collection[indexPath.row].foodTitle
                print(actualValue)
            }
        }
        
        switch collectionView {
        case self.foodCategoryCollectionView :
            cellSelectionFeedback(cv: foodCategoryCollectionView, collection: foodCategories, actualValue: &currentCategory)
            record.mealCategory?.itemTitle = currentCategory
            if (currentCategory != nil){
                record.mealCategory?.itemImage = "#imageLiteral(resourceName: '\(currentCategory!)')"
            }
        case self.breakfastOptionsCollectionView:
            cellSelectionFeedback(cv: breakfastOptionsCollectionView, collection: breakfastOptions, actualValue: &currentBreakfast)
            record.breakfastMeal?.itemTitle = currentBreakfast
            if (currentBreakfast != nil){
                record.breakfastMeal?.itemImage = "#imageLiteral(resourceName: '\(currentBreakfast!)')"
            }
        case self.lunchOptionsCollectionView:
            cellSelectionFeedback(cv: lunchOptionsCollectionView, collection: lunchOrDinnerOptions, actualValue: &currentLunch)
            record.lunchDinMeal?.itemTitle = currentLunch
            if (currentLunch != nil) {
                record.lunchDinMeal?.itemImage = "#imageLiteral(resourceName: '\(currentLunch!)')"
            }
        case self.snackOptionsCollectionView :
            cellSelectionFeedback(cv: snackOptionsCollectionView, collection: snackOptions, actualValue: &currentSnack)
            record.snackMeal?.itemTitle = currentSnack
            if (currentSnack != nil) {
                record.snackMeal?.itemImage = "#imageLiteral(resourceName: '\(currentSnack!)')"
            }
        case self.treatsOptionsCollectionView:
            cellSelectionFeedback(cv: treatsOptionsCollectionView, collection: treatsOptions, actualValue: &currentTreat)
            record.treatMeal?.itemTitle = currentTreat
            if (currentTreat != nil) {
                record.treatMeal?.itemImage = "#imageLiteral(resourceName: '\(currentTreat!)')"
            }
        case self.drinksOptionsCollectionView:
            cellSelectionFeedback(cv: drinksOptionsCollectionView, collection: drinksOptions, actualValue: &currentDrink)
            record.drink?.itemTitle = currentDrink
            if (currentDrink != nil) {
                record.drink?.itemImage = "#imageLiteral(resourceName: '\(currentDrink!)')"
            }
        case self.placesCollectionView:
            cellSelectionFeedback(cv: placesCollectionView, collection: places, actualValue: &currentPlace)
            record.place?.itemTitle = currentPlace
            if (currentPlace != nil){
                record.place?.itemImage = "#imageLiteral(resourceName: '\(currentPlace!)')"
            }
        case self.moodCollectionView:
            cellSelectionFeedback(cv: moodCollectionView, collection: moods, actualValue: &currentMood)
            record.mood?.itemTitle = currentMood
            if (currentMood != nil) {
                record.mood?.itemImage = "#imageLiteral(resourceName: '\(currentMood!)')"
            }
        case self.reactionCollectionView:
            cellSelectionFeedback(cv: reactionCollectionView, collection: reactions, actualValue: &currentReaction)
            record.reaction?.itemTitle = currentReaction
            if (currentReaction != nil) {
                record.reaction?.itemImage = "#imageLiteral(resourceName: '\(currentReaction!)')"
            }
        default:
            UICollectionView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == self.foodCategoryCollectionView {
            let cell : UICollectionViewCell = foodCategoryCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            record.mealCategory?.itemTitle = foodCategories[indexPath.row].foodTitle
        } else if collectionView == self.breakfastOptionsCollectionView {
            let cell : UICollectionViewCell = breakfastOptionsCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            record.breakfastMeal?.itemTitle = breakfastOptions[indexPath.row].foodTitle
        } else if collectionView == self.lunchOptionsCollectionView {
            let cell : UICollectionViewCell = lunchOptionsCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            record.lunchDinMeal?.itemTitle = lunchOrDinnerOptions[indexPath.row].foodTitle
        } else if collectionView == self.snackOptionsCollectionView {
            let cell : UICollectionViewCell = snackOptionsCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            record.snackMeal?.itemTitle = snackOptions[indexPath.row].foodTitle
        } else if collectionView == self.treatsOptionsCollectionView {
            let cell : UICollectionViewCell = treatsOptionsCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            record.treatMeal?.itemTitle = treatsOptions[indexPath.row].foodTitle
        } else if collectionView == self.drinksOptionsCollectionView {
            let cell : UICollectionViewCell = drinksOptionsCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            record.drink?.itemTitle = drinksOptions[indexPath.row].foodTitle
        } else if collectionView == self.placesCollectionView {
            let cell : UICollectionViewCell = placesCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            record.place?.itemTitle = places[indexPath.row].foodTitle
        } else if collectionView == self.moodCollectionView {
            let cell : UICollectionViewCell = moodCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            record.mood?.itemTitle = moods[indexPath.row].foodTitle
        } else if collectionView == self.reactionCollectionView {
            let cell : UICollectionViewCell = reactionCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            record.reaction?.itemTitle = reactions[indexPath.row].foodTitle
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
            layout.itemSize = CGSize(width: 60, height: 90)
            layout.scrollDirection = .horizontal
            return layout
        }()
    }
    
    
//    func loadData() {
//        // code to load data from network, and refresh the interface
//        self.foodCategoryCollectionView.reloadData()
//    }
    
    //Textfields Delegate Methods_________________________________________________
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldFood {
            textFieldFood.endEditing(true)
            print(textFieldFood.text!)
            return true
        } else if textField == textFieldMood {
            textFieldMood.endEditing(true)
            print(textFieldMood.text!)
            return true
        }
        return false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == textFieldFood {
            if textFieldFood.text != "" {
                return true
            } else {
                textFieldFood.placeholder = "Describe your meal"
                return false
            }
        } else if textField == textFieldMood {
            if textFieldFood.text != "" {
                return true
            } else {
                textFieldFood.placeholder = "Describe your meal"
                return false
            }
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textFieldFood {
            textFieldFood.becomeFirstResponder()
        } else if textField == textFieldMood {
            textFieldMood.becomeFirstResponder()
        }
        
    }
    
}




