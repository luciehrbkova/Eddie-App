//
//  L1M4ViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 28/02/2022.
//

import UIKit

class L1M4ViewController: UIViewController {

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
            gameManager.moduleGuide.moduleList[4].isCompleted = false
        } else {
            button.setTitle("Done!", for: .normal)
            isButtonPressed = true
            gameManager.moduleGuide.moduleList[4].isCompleted = true
            currentState = "anotherModuleCompleted"
        }
        print(gameManager.moduleGuide)
    }
    
    func displayCorrectButtonBasedOnState() {
        if (gameManager.moduleGuide.moduleList[4].isCompleted == true) {
            button.setTitle("Done!", for: .normal)
        } else {
            button.setTitle("Mark as completed", for: .normal)
        }
    }
    
}
