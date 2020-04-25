//
//  GnomesViewModel.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 22/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//

import UIKit

typealias GenomesGetDictionaryCompletion = ([GnomeModel], Bool) ->Void

class GnomesViewModel {

}

extension GnomesViewModel {
    
    func fetchGnomes(completion:@escaping (GenomesGetDictionaryCompletion)){
        GnomeServices.shared.getServices(url: baseUrl, completionBlock: {
            result in
            
            DispatchQueue.main.async {
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: result, options: []) as! [String: Any]
                                    
                        var arrayItems = [GnomeModel]()
                        let json = jsonResponse["Brastlewark"] as? [[String:Any]]
                        arrayItems = GnomeModel.itemsWithJson(itemJson: json!)
                    
                    if arrayItems.count > 0{
                        completion(arrayItems, true)
                    }else {
                        completion(arrayItems, false)
                    }
                    
                }catch let error as NSError {
                    print("Gnome Error. GVM: \(error.description)")
                }
            }
        })
    }
}
