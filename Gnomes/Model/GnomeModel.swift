//
//  ViewController.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 22/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//

import Foundation
import UIKit

class GnomeModel {
    
    var name: String = ""
    var age : Int = 0
    var thumbnail: String = ""
    var height: NSNumber = 0.0
    var weight: NSNumber = 0.0
    var hair_color : String = ""
    var professions : [ProfessionsModel] = [ProfessionsModel]()
    var friends : [FriendsModel] = [FriendsModel]()
    
    init(){
        
    }
    
    init(dataInput: [String:Any]){
        self.name = dataInput["name"] as! String
        self.age = dataInput["age"] as! Int
        self.thumbnail = dataInput["thumbnail"] as! String
        self.height = dataInput["height"] as! NSNumber
        self.weight = dataInput["weight"] as! NSNumber
        self.professions =  ProfessionsModel.itemsWithJson(itemJson: ((dataInput["professions"] as? [String])!) )
        self.friends =  FriendsModel.itemsWithJson(itemJson: ((dataInput["friends"] as? [String])!) )
        
    }
    
    static func itemsWithJson (itemJson : [[String:Any]]) -> [GnomeModel] {
        var arrayItems = [GnomeModel]()
        for item in itemJson {
            let gnome = GnomeModel.init(dataInput: item)
            arrayItems.append(gnome)
            
        }
        return arrayItems
    }
}
