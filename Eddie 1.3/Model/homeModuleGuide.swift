//
//  homeModuleGuide.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 14/02/2022.
//

import Foundation
import UIKit

struct ModuleGuide {
    var moduleTitle: String
    var moduleImage: UIImage
//    let level: Int
//    let handler: (() -> Void)
}



var moduleGuides1: [ModuleGuide] = [
    ModuleGuide(moduleTitle: "0/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
    ModuleGuide(moduleTitle: "1/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
    ModuleGuide(moduleTitle: "2/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
    ModuleGuide(moduleTitle: "3/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
    ModuleGuide(moduleTitle: "4/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
    ModuleGuide(moduleTitle: "5/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
]

func adjustImage(sectionOrderinList: Int) -> UIImage {
    let checkmarkImage: UIImage
//    let imageString: String
    if (gameManager.moduleGuide.moduleList[sectionOrderinList].isCompleted == false) {
//        imageString = "checkmark.circle.fill"
        checkmarkImage = UIImage(systemName: "checkmark.circle.fill")!
        return checkmarkImage
    } else {
        checkmarkImage = UIImage(systemName: "checkmark.circle")!
        return checkmarkImage
    }
}

func adjustText(sectionOrderinList: Int) -> String {
    let textString: String
    if (gameManager.moduleGuide.moduleList[sectionOrderinList].isCompleted == false) {
        textString = "\(sectionOrderinList)/5"
        return textString
    } else {
        textString = "DONE"
        return textString
    }
}


