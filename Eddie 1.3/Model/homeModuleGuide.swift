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
    ModuleGuide(moduleTitle: "1/5", moduleImage: UIImage(systemName: adjustImage(sectionOrderinList: 0))! ),
    ModuleGuide(moduleTitle: "2/5", moduleImage: UIImage(systemName: adjustImage(sectionOrderinList: 1))! ),
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
