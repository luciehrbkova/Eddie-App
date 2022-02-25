//
//  LogViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

struct input {
    var date: String?
    var time: String?
    var category: inputDetail
    var meal: inputDetail
    var note: String?
}
struct inputDetail {
    var detailTitle: String?
    var deatilImage: String?
}
// "#imageLiteral(resourceName: 'Breakfast')"

var recordInput = input(date: nil, time: nil,
                        category: inputDetail(detailTitle: nil, deatilImage: nil),
                        meal: inputDetail(detailTitle: nil, deatilImage: nil),
                        note: nil)

var record = Record(date: nil, time: nil,
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
    
    var chosenValue = String()
    var currentCategory: String? = ""
    var currentBreakfast: String? = ""
    var time = String()
    var date = String()
    
    
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
        recordInput.date = formatter.string(from: sender.date)
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        recordInput.time = formatter.string(from: sender.date)
    }

    @IBAction func logButton(_ sender: Any) {
        textFieldFood.endEditing(true)
        textFieldMood.endEditing(true)
        if textFieldFood.text != "" {
            recordInput.note = textFieldFood.text
        }
        readTime(sender: timePicker)
//        database.addRecord(recordDate: recordInput.date,
//                           recordTime: recordInput.time,
//                           mealCategoryTitle: recordInput.category.detailTitle,
//                           mealCategoryImage: recordInput.category.deatilImage,
//                           breakfastMealTitle: recordInput.meal.detailTitle,
//                           breakfastMealImage: recordInput.meal.deatilImage,
//                           foodNote: recordInput.note)
        
//        print("this is current date: \(date)")
//        print("this is current time: \(time)")
        print("This bitch")
        print(record.mealCategory?.itemTitle)
        print(record.mealCategory?.itemImage)
        print(record.breakfastMeal?.itemTitle)
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
                record.mealCategory?.itemImage = " #imageLiteral(resourceName: \"Breakfast\")"
            } else  {
                record.mealCategory?.itemImage =  nil
            }
//            recordInput.category.deatilImage = #imageLiteral(resourceName: "\(currentCategory)")
            print("This is record.meal.category: \(record.mealCategory?.itemTitle)")
        case self.breakfastOptionsCollectionView:
            cellSelectionFeedback(cv: breakfastOptionsCollectionView, collection: breakfastOptions, actualValue: &currentBreakfast)
            record.breakfastMeal?.itemTitle = currentBreakfast
            if (currentBreakfast != nil){
//                record.breakfastMeal?.itemImage = #imageLiteral(resourceName: "\(currentBreakfast)")
            }
            print("This is record.breakfast: \(record.breakfastMeal?.itemTitle)")
//            recordInput.category.detailTitle = chosenValue
//            recordInput.category.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
//        case self.lunchOptionsCollectionView:
//            cellSelectionFeedback(cv: lunchOptionsCollectionView, collection: lunchOrDinnerOptions)
//            recordInput.category.detailTitle = chosenValue
//            recordInput.category.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
//        case self.snackOptionsCollectionView :
//            cellSelectionFeedback(cv: snackOptionsCollectionView, collection: snackOptions)
//            recordInput.category.detailTitle = chosenValue
//            recordInput.category.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
//        case self.treatsOptionsCollectionView:
//            cellSelectionFeedback(cv: treatsOptionsCollectionView, collection: treatsOptions)
//            recordInput.category.detailTitle = chosenValue
//            recordInput.category.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
//        case self.drinksOptionsCollectionView:
//            cellSelectionFeedback(cv: drinksOptionsCollectionView, collection: drinksOptions)
//            recordInput.category.detailTitle = chosenValue
//            recordInput.category.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
//        case self.placesCollectionView:
//            cellSelectionFeedback(cv: placesCollectionView, collection: places)
//            recordInput.category.detailTitle = chosenValue
//            recordInput.category.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
//        case self.moodCollectionView:
//            cellSelectionFeedback(cv: moodCollectionView, collection: moods)
//            recordInput.category.detailTitle = chosenValue
//            recordInput.category.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
//        case self.reactionCollectionView:
//            cellSelectionFeedback(cv: reactionCollectionView, collection: reactions)
//            recordInput.category.detailTitle = chosenValue
//            recordInput.category.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
        default:
            UICollectionView()
        }
        
        
        
        
        
//        if collectionView == self.foodCategoryCollectionView {
//            let cell : UICollectionViewCell = foodCategoryCollectionView.cellForItem(at: indexPath)!
//            cell.layer.cornerRadius = 10
//            cell.layer.masksToBounds = true
//
//            if foodCategories[indexPath.row].foodTitle == chosenValue {
//                cell.backgroundColor = .white
//                chosenValue = "nil"
//                print(chosenValue)
//            } else {
//                cell.backgroundColor = .systemGray6
//                chosenValue = foodCategories[indexPath.row].foodTitle
//                print(chosenValue)
//            }
//            recordInput.category.detailTitle = chosenValue
//            recordInput.category.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
//
//        } else if collectionView == self.breakfastOptionsCollectionView {
//            let cell : UICollectionViewCell = breakfastOptionsCollectionView.cellForItem(at: indexPath)!
//            cell.layer.cornerRadius = 10
//            cell.layer.masksToBounds = true
//
//            if breakfastOptions[indexPath.row].foodTitle == chosenValue {
//                cell.backgroundColor = .white
//                chosenValue = "nil"
//                print(chosenValue)
//            } else {
//                cell.backgroundColor = .systemGray6
//                chosenValue = breakfastOptions[indexPath.row].foodTitle
//                print(chosenValue)
//            }
//
//            recordInput.meal.detailTitle = chosenValue
//            recordInput.meal.deatilImage = "#imageLiteral(resourceName: '\(chosenValue)')"
//
//        } else if collectionView == self.lunchOptionsCollectionView {
//            let cell : UICollectionViewCell = lunchOptionsCollectionView.cellForItem(at: indexPath)!
//            cell.layer.cornerRadius = 10
//            cell.layer.masksToBounds = true
//            cell.backgroundColor = .systemGray6
//            print(lunchOrDinnerOptions[indexPath.row].foodTitle)
//        } else if collectionView == self.snackOptionsCollectionView {
//            print(snackOptions[indexPath.row].foodTitle)
//        } else if collectionView == self.treatsOptionsCollectionView {
//            print(treatsOptions[indexPath.row].foodTitle)
//        } else if collectionView == self.drinksOptionsCollectionView {
//            print(drinksOptions[indexPath.row].foodTitle)
//        } else if collectionView == self.placesCollectionView {
//            print( places[indexPath.row].foodTitle)
//        } else if collectionView == self.moodCollectionView {
//            print(moods[indexPath.row].foodTitle)
//        } else if collectionView == self.reactionCollectionView {
//            print(reactions[indexPath.row].foodTitle)
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == self.foodCategoryCollectionView {
            let cell : UICollectionViewCell = foodCategoryCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .systemBackground
            print(foodCategories[indexPath.row].foodTitle)
            record.mealCategory?.itemTitle = foodCategories[indexPath.row].foodTitle
//            recordInput.category = foodCategories[indexPath.row].foodTitle
        } else if collectionView == self.breakfastOptionsCollectionView {
            let cell : UICollectionViewCell = breakfastOptionsCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .white
            print(breakfastOptions[indexPath.row].foodTitle)
//            recordInput.meal = breakfastOptions[indexPath.row].foodTitle
        } else if collectionView == self.lunchOptionsCollectionView {
            let cell : UICollectionViewCell = lunchOptionsCollectionView.cellForItem(at: indexPath)!
            cell.backgroundColor = .white
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




