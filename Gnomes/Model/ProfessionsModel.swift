//
//  Professions.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 23/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//

import Foundation
import UIKit

class ProfessionsModel {
    
    var name: String?

    
    init(dataInput: String){
        self.name = dataInput
    }
    
    static func itemsWithJson (itemJson : [String]) -> [ProfessionsModel] {
        var arrayItems = [ProfessionsModel]()
        for item in itemJson {
            let professions = ProfessionsModel.init(dataInput: item)
            arrayItems.append(professions)
            
        }
        return arrayItems
    }
}
