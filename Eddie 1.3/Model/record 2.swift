//
//  record.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 18/02/2022.
//

//import Foundation
//import UIKit
//
//struct Record {
//    var image: UIImage
//    var title: String
//
//}
//
//var recordsDatabase: [Record] = [
//    Record(image: #imageLiteral(resourceName: "Breakfast"), title: "Breakfast"),
//    Record(image: #imageLiteral(resourceName: "Breakfast"), title: "Breakfast"),
//    Record(image: #imageLiteral(resourceName: "Breakfast"), title: "Breakfast"),
//    Record(image: #imageLiteral(resourceName: "Breakfast"), title: "Breakfast"),
//
//]

import Foundation
import UIKit

struct Record {
    var date: String?
    var time: String?
    var mealCategory: ItemDetail?
    var breakfastMeal: ItemDetail?
    var lunchDinMeal: ItemDetail?
    var snackMeal: ItemDetail?
    var treatMeal: ItemDetail?
    let drink: ItemDetail?
    let foodNote: String?
    let place: ItemDetail?
    let mood: ItemDetail?
    let reaction: ItemDetail?
    let moodNote: String?

}

struct ItemDetail {
    var itemTitle: String?
    var itemImage: UIImage
}

let RecordsDatabase: [Record] = [
    Record(date: nil,
           time: nil,
           mealCategory: ItemDetail(itemTitle: "Breakfast", itemImage: #imageLiteral(resourceName: "Breakfast")),
           breakfastMeal: ItemDetail(itemTitle: "Cereals", itemImage: #imageLiteral(resourceName: "Cereals")),
           lunchDinMeal: nil,
           snackMeal: nil,
           treatMeal: nil,
           drink: ItemDetail(itemTitle: "Juice", itemImage: #imageLiteral(resourceName: "Juice")),
           foodNote: "Blueberry poridge",
           place: ItemDetail(itemTitle: "Home", itemImage: #imageLiteral(resourceName: "Home")),
           mood: ItemDetail(itemTitle: "Energetic", itemImage: #imageLiteral(resourceName: "Energetic")),
           reaction: nil,
           moodNote: "I have enjoyed my meal" ),
    Record(date: nil,
           time: nil,
           mealCategory: ItemDetail(itemTitle: "Breakfast", itemImage: #imageLiteral(resourceName: "Breakfast")),
           breakfastMeal: ItemDetail(itemTitle: "Cereals", itemImage: #imageLiteral(resourceName: "Cereals")),
           lunchDinMeal: nil,
           snackMeal: nil,
           treatMeal: nil,
           drink: ItemDetail(itemTitle: "Juice", itemImage: #imageLiteral(resourceName: "Juice")),
           foodNote: "Blueberry poridge",
           place: ItemDetail(itemTitle: "Home", itemImage: #imageLiteral(resourceName: "Home")),
           mood: ItemDetail(itemTitle: "Energetic", itemImage: #imageLiteral(resourceName: "Energetic")),
           reaction: nil,
           moodNote: "I have enjoyed my meal" ),
    Record(date: nil,
           time: nil,
           mealCategory: ItemDetail(itemTitle: "Breakfast", itemImage: #imageLiteral(resourceName: "Breakfast")),
           breakfastMeal: ItemDetail(itemTitle: "Cereals", itemImage: #imageLiteral(resourceName: "Cereals")),
           lunchDinMeal: nil,
           snackMeal: nil,
           treatMeal: nil,
           drink: ItemDetail(itemTitle: "Juice", itemImage: #imageLiteral(resourceName: "Juice")),
           foodNote: "Blueberry poridge",
           place: ItemDetail(itemTitle: "Home", itemImage: #imageLiteral(resourceName: "Home")),
           mood: ItemDetail(itemTitle: "Energetic", itemImage: #imageLiteral(resourceName: "Energetic")),
           reaction: nil,
           moodNote: "I have enjoyed my meal" ),
    Record(date: nil,
           time: nil,
           mealCategory: ItemDetail(itemTitle: "Breakfast", itemImage: #imageLiteral(resourceName: "Breakfast")),
           breakfastMeal: ItemDetail(itemTitle: "Cereals", itemImage: #imageLiteral(resourceName: "Cereals")),
           lunchDinMeal: nil,
           snackMeal: nil,
           treatMeal: nil,
           drink: ItemDetail(itemTitle: "Juice", itemImage: #imageLiteral(resourceName: "Juice")),
           foodNote: "Blueberry poridge",
           place: ItemDetail(itemTitle: "Home", itemImage: #imageLiteral(resourceName: "Home")),
           mood: ItemDetail(itemTitle: "Energetic", itemImage: #imageLiteral(resourceName: "Energetic")),
           reaction: nil,
           moodNote: "I have enjoyed my meal" ),
    Record(date: nil,
           time: nil,
           mealCategory: ItemDetail(itemTitle: "Breakfast", itemImage: #imageLiteral(resourceName: "Breakfast")),
           breakfastMeal: ItemDetail(itemTitle: "Cereals", itemImage: #imageLiteral(resourceName: "Cereals")),
           lunchDinMeal: nil,
           snackMeal: nil,
           treatMeal: nil,
           drink: ItemDetail(itemTitle: "Juice", itemImage: #imageLiteral(resourceName: "Juice")),
           foodNote: "Blueberry poridge",
           place: ItemDetail(itemTitle: "Home", itemImage: #imageLiteral(resourceName: "Home")),
           mood: ItemDetail(itemTitle: "Energetic", itemImage: #imageLiteral(resourceName: "Energetic")),
           reaction: nil,
           moodNote: "I have enjoyed my meal" ),
    Record(date: nil,
           time: nil,
           mealCategory: ItemDetail(itemTitle: "Breakfast", itemImage: #imageLiteral(resourceName: "Breakfast")),
           breakfastMeal: ItemDetail(itemTitle: "Cereals", itemImage: #imageLiteral(resourceName: "Cereals")),
           lunchDinMeal: nil,
           snackMeal: nil,
           treatMeal: nil,
           drink: ItemDetail(itemTitle: "Juice", itemImage: #imageLiteral(resourceName: "Juice")),
           foodNote: "Blueberry poridge",
           place: ItemDetail(itemTitle: "Home", itemImage: #imageLiteral(resourceName: "Home")),
           mood: ItemDetail(itemTitle: "Energetic", itemImage: #imageLiteral(resourceName: "Energetic")),
           reaction: nil,
           moodNote: "I have enjoyed my meal" ),
    Record(date: nil,
           time: nil,
           mealCategory: ItemDetail(itemTitle: "Breakfast", itemImage: #imageLiteral(resourceName: "Breakfast")),
           breakfastMeal: ItemDetail(itemTitle: "Cereals", itemImage: #imageLiteral(resourceName: "Cereals")),
           lunchDinMeal: nil,
           snackMeal: nil,
           treatMeal: nil,
           drink: ItemDetail(itemTitle: "Juice", itemImage: #imageLiteral(resourceName: "Juice")),
           foodNote: "Blueberry poridge",
           place: ItemDetail(itemTitle: "Home", itemImage: #imageLiteral(resourceName: "Home")),
           mood: ItemDetail(itemTitle: "Energetic", itemImage: #imageLiteral(resourceName: "Energetic")),
           reaction: nil,
           moodNote: "I have enjoyed my meal" ),
]


