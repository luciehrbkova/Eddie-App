//
//  L1M1ViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 28/02/2022.
//

import UIKit

class L1M1ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var isButton1Pressed = false
    var isButton2Pressed = false
    var isButton3Pressed = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func button1Pressed(_ sender: Any) {
        clickButton(button: button1, state: &isButton1Pressed)
    }
    
    @IBAction func button2Pressed(_ sender: Any) {
        clickButton(button: button2, state: &isButton2Pressed)
    }
    
    @IBAction func button3Pressed(_ sender: Any) {
        checkState()
        adjustImage(sectionOrderinList: 1)
        
    }
    
    
    func clickButton(button: UIButton, state: inout Bool ) {
        if state {
            button.setTitle("Mark as completed", for: .normal)
            state = false
        } else {
            button.setTitle("Done!", for: .normal)
            state = true
        }
    }
    
    
    func checkState() {
        if isButton3Pressed {
            button3.setTitle("Mark as completed", for: .normal)
            isButton3Pressed = false
            gameManager.moduleGuide.moduleList[1].isCompleted = false
        } else {
            button3.setTitle("Done!", for: .normal)
            isButton3Pressed = true
            gameManager.moduleGuide.moduleList[1].isCompleted = true
            currentState = "anotherModuleCompleted"
        }
        print(gameManager.moduleGuide)
    }
    
    func displayCorrectButtonBasedOnState() {
        if (gameManager.moduleGuide.moduleList[1].isCompleted == true) {
            button3.setTitle("Done!", for: .normal)
        } else {
            button3.setTitle("Mark as completed", for: .normal)
        }
    }
    
    

}
