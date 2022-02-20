//
//  award.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import Foundation
import UIKit

struct FoodCollection {
    let foodTitle: String
    let foodImage: UIImage
}

let foodCategories: [FoodCollection] = [
    FoodCollection(foodTitle: "Breakfast", foodImage: #imageLiteral(resourceName: "Breakfast") ),
    FoodCollection(foodTitle: "Lunch", foodImage: #imageLiteral(resourceName: "Lunch") ),
    FoodCollection(foodTitle: "Dinner", foodImage: #imageLiteral(resourceName: "Dinner") ),
    FoodCollection(foodTitle: "Snack", foodImage: #imageLiteral(resourceName: "Snack") ),
    FoodCollection(foodTitle: "Other", foodImage: #imageLiteral(resourceName: "Other") ),
]

let breakfastOptions: [FoodCollection] = [
    FoodCollection(foodTitle: "Cereals", foodImage: #imageLiteral(resourceName: "Cereals") ),
    FoodCollection(foodTitle: "Pastry", foodImage: #imageLiteral(resourceName: "Pastry") ),
    FoodCollection(foodTitle: "Yoghurt", foodImage: #imageLiteral(resourceName: "Yoghurt") ),
    FoodCollection(foodTitle: "Toast", foodImage: #imageLiteral(resourceName: "Toast") ),
    FoodCollection(foodTitle: "Fruit", foodImage: #imageLiteral(resourceName: "Fruit") ),
    FoodCollection(foodTitle: "Eggs", foodImage: #imageLiteral(resourceName: "Eggs") ),
]

let lunchOrDinnerOptions: [FoodCollection] = [
    FoodCollection(foodTitle: "Soup", foodImage: #imageLiteral(resourceName: "Soup") ),
    FoodCollection(foodTitle: "Salad", foodImage: #imageLiteral(resourceName: "Salad") ),
    FoodCollection(foodTitle: "Pasta", foodImage: #imageLiteral(resourceName: "Pasta") ),
    FoodCollection(foodTitle: "Pizza", foodImage: #imageLiteral(resourceName: "Pizza") ),
    FoodCollection(foodTitle: "Fish", foodImage: #imageLiteral(resourceName: "Fish") ),
    FoodCollection(foodTitle: "Chicken", foodImage: #imageLiteral(resourceName: "Chicken") ),
    FoodCollection(foodTitle: "Nuddles", foodImage: #imageLiteral(resourceName: "Nudles") ),
    FoodCollection(foodTitle: "Rice", foodImage: #imageLiteral(resourceName: "Rice") ),
    FoodCollection(foodTitle: "Curry", foodImage: #imageLiteral(resourceName: "Curry") ),
    FoodCollection(foodTitle: "Steak", foodImage: #imageLiteral(resourceName: "Steak") ),
    FoodCollection(foodTitle: "Sandwich", foodImage: #imageLiteral(resourceName: "Sandwich") ),
    FoodCollection(foodTitle: "Burger", foodImage: #imageLiteral(resourceName: "Burger") ),
    FoodCollection(foodTitle: "Tortillas", foodImage: #imageLiteral(resourceName: "Tortillas") ),
    FoodCollection(foodTitle: "Sushi", foodImage: #imageLiteral(resourceName: "Sushi") ),
    FoodCollection(foodTitle: "Shellfish", foodImage: #imageLiteral(resourceName: "Shellfish") ),
    FoodCollection(foodTitle: "Stew", foodImage: #imageLiteral(resourceName: "Stew") ),
]

let snackOptions: [FoodCollection] = [
    FoodCollection(foodTitle: "Fruit", foodImage: #imageLiteral(resourceName: "FruitSn") ),
    FoodCollection(foodTitle: "Cereal bar", foodImage: #imageLiteral(resourceName: "Cereal bar") ),
    FoodCollection(foodTitle: "Pastry", foodImage: #imageLiteral(resourceName: "PastrySn") ),
    FoodCollection(foodTitle: "Toast", foodImage: #imageLiteral(resourceName: "ToastSn") ),
    FoodCollection(foodTitle: "Yoghurt", foodImage: #imageLiteral(resourceName: "YoghurtSn") ),
    FoodCollection(foodTitle: "Vegetable", foodImage: #imageLiteral(resourceName: "Vegetable") ),
]

let treatsOptions: [FoodCollection] = [
    FoodCollection(foodTitle: "Cake", foodImage: #imageLiteral(resourceName: "Cake")),
    FoodCollection(foodTitle: "Crisps", foodImage: #imageLiteral(resourceName: "Crisps")),
    FoodCollection(foodTitle: "Cookies", foodImage: #imageLiteral(resourceName: "Cookies")),
    FoodCollection(foodTitle: "Pudding", foodImage: #imageLiteral(resourceName: "Pudding")),
    FoodCollection(foodTitle: "Choco bar", foodImage: #imageLiteral(resourceName: "Chocolate bar"))
]

let drinksOptions: [FoodCollection] = [
    FoodCollection(foodTitle: "Coffee", foodImage: #imageLiteral(resourceName: "Coffee")),
    FoodCollection(foodTitle: "Tea", foodImage: #imageLiteral(resourceName: "Tea")),
    FoodCollection(foodTitle: "Juice", foodImage: #imageLiteral(resourceName: "Juice")),
    FoodCollection(foodTitle: "Milk", foodImage: #imageLiteral(resourceName: "Milk")),
    FoodCollection(foodTitle: "Lemo", foodImage: #imageLiteral(resourceName: "Lemonade")),
    FoodCollection(foodTitle: "Cocktail", foodImage: #imageLiteral(resourceName: "Cocktail"))
]

let places: [FoodCollection] = [
    FoodCollection(foodTitle: "Home", foodImage: #imageLiteral(resourceName: "Home")),
    FoodCollection(foodTitle: "School", foodImage: #imageLiteral(resourceName: "School")),
    FoodCollection(foodTitle: "Work", foodImage: #imageLiteral(resourceName: "Work")),
    FoodCollection(foodTitle: "Office", foodImage: #imageLiteral(resourceName: "Office")),
    FoodCollection(foodTitle: "Canteene", foodImage: #imageLiteral(resourceName: "Canteene")),
    FoodCollection(foodTitle: "Bistro", foodImage: #imageLiteral(resourceName: "Restaurant")),
    FoodCollection(foodTitle: "Friend's place", foodImage: #imageLiteral(resourceName: "Friend's place")),
    FoodCollection(foodTitle: "Party", foodImage: #imageLiteral(resourceName: "Party")),
    FoodCollection(foodTitle: "Park", foodImage: #imageLiteral(resourceName: "Park")),
]

let moods: [FoodCollection] = [
    FoodCollection(foodTitle: "Happy", foodImage: #imageLiteral(resourceName: "Happy")),
    FoodCollection(foodTitle: "Energetic", foodImage: #imageLiteral(resourceName: "Energetic")),
    FoodCollection(foodTitle: "Mood swings", foodImage: #imageLiteral(resourceName: "Mood swings")),
    FoodCollection(foodTitle: "Irritated", foodImage: #imageLiteral(resourceName: "Irritated")),
    FoodCollection(foodTitle: "Sad", foodImage: #imageLiteral(resourceName: "Sad")),
    FoodCollection(foodTitle: "Anxious", foodImage: #imageLiteral(resourceName: "Anxious")),
    FoodCollection(foodTitle: "Depressed", foodImage: #imageLiteral(resourceName: "Depressed")),
    FoodCollection(foodTitle: "Feeling guilty", foodImage: #imageLiteral(resourceName: "Feeling guilty")),
    FoodCollection(foodTitle: "Obssesive thoughts", foodImage: #imageLiteral(resourceName: "Obssesive thoughts")),
    FoodCollection(foodTitle: "Apathetic", foodImage: #imageLiteral(resourceName: "Apathetic")),
    FoodCollection(foodTitle: "Confused", foodImage: #imageLiteral(resourceName: "Confused")),
    FoodCollection(foodTitle: "Very self- critical", foodImage: #imageLiteral(resourceName: "Very self- critical"))
]

let reactions: [FoodCollection] = [
    FoodCollection(foodTitle: "Vomiting", foodImage: #imageLiteral(resourceName: "Vomiting")),
    FoodCollection(foodTitle: "Laxative", foodImage: #imageLiteral(resourceName: "Laxative")),
    FoodCollection(foodTitle: "Diuretic", foodImage: #imageLiteral(resourceName: "Diuretic")),
    FoodCollection(foodTitle: "Exercise", foodImage: #imageLiteral(resourceName: "Exercise")),
    FoodCollection(foodTitle: "Avoiding next meal", foodImage: #imageLiteral(resourceName: "Avoiding")),
]


