//
//  Friendss.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 24/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//

import Foundation
import UIKit

class FriendsModel {
    
    var name: String?

    
    init(dataInput: String){
        self.name = dataInput
    }
    
    static func itemsWithJson (itemJson : [String]) -> [FriendsModel] {
        var arrayItems = [FriendsModel]()
        for item in itemJson {
            let friends = FriendsModel.init(dataInput: item)
            arrayItems.append(friends)
            
        }
        return arrayItems
    }
}
