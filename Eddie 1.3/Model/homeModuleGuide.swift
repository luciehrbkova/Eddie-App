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
    ModuleGuide(moduleTitle: "1/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
    ModuleGuide(moduleTitle: "2/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
    ModuleGuide(moduleTitle: "3/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
    ModuleGuide(moduleTitle: "4/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! ),
    ModuleGuide(moduleTitle: "5/5", moduleImage: UIImage(systemName: "checkmark.circle.fill")! )
]
