//
//  Motivation.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 05/04/2022.
//

import Foundation

var motivation: String = ""
var currentState: String = ""

func updateMotivation(state: String) {
    switch state {
    case "home":
        motivation = "Welcome home"
    case "mealRecorded":
        motivation = "You are amazing! good job in keeping track of your meals and thoughts. Your hard work will pay off!"
    case "threeMealsCompleted":
        motivation = "Congratulation! you have achieved a great Victory."
       
    default:
        motivation = "Motivation:Instances of DateFormatter create string representations of NSDate objects, and convert textual representations of dates and times into NSDate objects, and convert textual representations of dates "
    }
}
