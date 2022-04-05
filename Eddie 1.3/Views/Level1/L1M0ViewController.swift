//
//  L1M0ViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 05/04/2022.
//

import UIKit

class L1M0ViewController: UIViewController {
    
    var homeVC = HomeViewController()
    
    
    @IBOutlet weak var button: UIButton!
    var isButtonPressed = false
    var receivedData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(receivedData)
        displayCorrectButtonBasedOnState()
    }
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        checkState()
        adjustImage(sectionOrderinList: 0)
    }
    
    func checkState() {
        if isButtonPressed {
            button.setTitle("Mark as completed", for: .normal)
            isButtonPressed = false
            gameManager.moduleGuide.moduleList[0].isCompleted = false
        } else {
            button.setTitle("Done!", for: .normal)
            isButtonPressed = true
            gameManager.moduleGuide.moduleList[0].isCompleted = true
            homeAwards.append(Award(awardTitle: "victory", awardImage: #imageLiteral(resourceName: "AwardBravery"), awardsNumber: 2))
            currentState = "introCompleted"
//            homeVC.badgeDisplay(badgeImage: "AwardBravery.png")
        }
        print(gameManager.moduleGuide)
    }
    
    func displayCorrectButtonBasedOnState() {
        if (gameManager.moduleGuide.moduleList[0].isCompleted == true) {
            button.setTitle("Done!", for: .normal)
            // call function
//            homeVC.getBraveryBadge()
        } else {
            button.setTitle("Mark as completed", for: .normal)
        }
    }


}
