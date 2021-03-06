//
//  L1M2ViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 28/02/2022.
//

import UIKit

class L1M2ViewController: UIViewController {

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
//        adjustImage(sectionOrderinList: 2)
    }
    
    func checkState() {
        if isButtonPressed {
            button.setTitle("Mark as completed", for: .normal)
            isButtonPressed = false
            gameManager.moduleGuide.moduleList[2].isCompleted = false
        } else {
            button.setTitle("Done!", for: .normal)
            isButtonPressed = true
            gameManager.moduleGuide.moduleList[2].isCompleted = true
            currentState = "anotherModuleCompleted"
        }
        print(gameManager.moduleGuide)
    }
    
    func displayCorrectButtonBasedOnState() {
        if (gameManager.moduleGuide.moduleList[2].isCompleted == true) {
            button.setTitle("Done!", for: .normal)
        } else {
            button.setTitle("Mark as completed", for: .normal)
        }
    }

}

