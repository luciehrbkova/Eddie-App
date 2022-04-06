//
//  GameManager.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 06/03/2022.
//

import Foundation


class GameMananager {
    
    struct ModuleSection {
        let name: String
        var isCompleted: Bool
    }

    struct ModuleGuide {
        let numberOfSections: Int
        var moduleList: [ModuleSection]
        var isCompleted: Bool
    }
    
    var moduleGuide = ModuleGuide(numberOfSections: 5,
                                  moduleList: [ ModuleSection(name: "0/5", isCompleted: false),
                                                ModuleSection(name: "1/5", isCompleted: false),
                                                ModuleSection(name: "2/5", isCompleted: false),
                                                ModuleSection(name: "3/5", isCompleted: false),
                                                ModuleSection(name: "4/5", isCompleted: false),
                                                ModuleSection(name: "5/5", isCompleted: false)],
                                  isCompleted: false)
   
    func checkCompletedSections() {
        for i in moduleGuide.moduleList {
            print(i.name)
        }
        print("Section")
    }
    
    func checkCompletedModules() {
        print("Module")
    }
    
                                              
    
}
