//
//  homeModuleGuide.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 14/02/2022.
//

import Foundation
import UIKit

struct ModuleGuide {
    let moduleTitle: String
    var moduleImage: UIImage
//    let level: Int
//    let handler: (() -> Void)
}



var moduleGuides1: [ModuleGuide] = [
    ModuleGuide(moduleTitle: "0/5", moduleImage: UIImage(systemName: adjustImage(sectionOrderinList: 2))! ),
    ModuleGuide(moduleTitle: adjustText(sectionOrderinList: 1), moduleImage: UIImage(systemName: adjustImage(sectionOrderinList: 1))! ),
    ModuleGuide(moduleTitle: adjustText(sectionOrderinList: 2), moduleImage: UIImage(systemName: adjustImage(sectionOrderinList: 2))! ),
    ModuleGuide(moduleTitle: "3/5", moduleImage: UIImage(systemName: adjustImage(sectionOrderinList: 2))! ),
    ModuleGuide(moduleTitle: "4/5", moduleImage: UIImage(systemName: adjustImage(sectionOrderinList: 3))! ),
    ModuleGuide(moduleTitle: "5/5", moduleImage: UIImage(systemName: adjustImage(sectionOrderinList: 4))! ),
]

func adjustImage(sectionOrderinList: Int) -> String {
    let imageString: String
    if (gameManager.moduleGuide.moduleList[sectionOrderinList].isCompleted == false) {
        imageString = "checkmark.circle.fill"
        return imageString
    } else {
        imageString = "checkmark.circle"
        return imageString
    }
}

func adjustText(sectionOrderinList: Int) -> String {
    let textString: String
    if (gameManager.moduleGuide.moduleList[sectionOrderinList].isCompleted == false) {
        textString = "\(sectionOrderinList)/5"
        return textString
    } else {
        textString = "\(sectionOrderinList)/6"
        return textString
    }
}
