//
//  GnomeServices.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 22/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//

import UIKit
import Foundation

class GnomeServices {

    static let shared: GnomeServices = GnomeServices()
    
    func getServices(url : String!, completionBlock: @escaping (Data) -> Void) {
        
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            //print(String(describing: error))
            return
          }
          completionBlock(data)
        }

        task.resume()
    }
}


