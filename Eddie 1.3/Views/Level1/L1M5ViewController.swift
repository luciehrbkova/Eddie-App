//
//  L1M5ViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 28/02/2022.
//

import UIKit

class L1M5ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    var isButtonPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCorrectButtonBasedOnState()
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        checkState()
    }
    
    func checkState() {
        if isButtonPressed {
            button.setTitle("Mark as completed", for: .normal)
            isButtonPressed = false
            gameManager.moduleGuide.moduleList[5].isCompleted = false
        } else {
            button.setTitle("Done!", for: .normal)
            isButtonPressed = true
            gameManager.moduleGuide.moduleList[5].isCompleted = true
            homeAwards.append(Award(awardTitle: "Medal", awardImage: #imageLiteral(resourceName: "AwardMedal"), awardsNumber: 2))
            currentState = "allSectionCompleted"
        }
        print(gameManager.moduleGuide)
    }
    
    func displayCorrectButtonBasedOnState() {
        if (gameManager.moduleGuide.moduleList[5].isCompleted == true) {
            button.setTitle("Done!", for: .normal)
        } else {
            button.setTitle("Mark as completed", for: .normal)
        }
    }
    
}
