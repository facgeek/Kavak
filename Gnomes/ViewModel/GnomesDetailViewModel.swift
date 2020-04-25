//
//  DetailViewModel.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 24/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//

import UIKit

typealias resultCompletion = (String) ->Void

class GnomesDetailViewModel {

}


extension GnomesDetailViewModel {
    func getListProfessionsItems (array : [Any], completion:@escaping (resultCompletion)){
        
        var arrayItems = [String]()
        for item in array as! [ProfessionsModel] {
            arrayItems.append(item.name ?? "")
        }

        if arrayItems.count > 0 {
            completion(arrayItems.joined(separator: ", "))
        }else {
            completion("Doesn´t have professions")
        }
        
    }
    
    func getListFriendsItems (array : [Any], completion:@escaping (resultCompletion)){
    
        var arrayItems = [String]()
        for item in array as! [FriendsModel] {
            arrayItems.append(item.name ?? "")
        }

        if arrayItems.count > 0 {
            completion(arrayItems.joined(separator: ", "))
        }else {
            completion("Doesn´t have friends")
        }
        
    }
}
