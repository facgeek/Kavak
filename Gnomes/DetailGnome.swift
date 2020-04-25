//
//  DetailGnome.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 23/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//

import UIKit

class DetailGnome: UIViewController {

    @IBOutlet var imageGnome : UIImageView!
    @IBOutlet var nameLbl : UILabel!
    @IBOutlet var ageLbl : UILabel!
    @IBOutlet var height : UILabel!
    @IBOutlet var weight : UILabel!
    @IBOutlet var worksLbl : UILabel!
    @IBOutlet var friendsLbl : UILabel!
    
    //ViewModel
    var gnomesDetailViewModel = GnomesDetailViewModel()
    
    //List
    var item = GnomeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = item.name
        ageLbl.text = String(item.age) + " years"
        height.text = "HEIGHT : " + item.height.stringValue
        weight.text = "WEIGHT : " + item.weight.stringValue
        imageGnome.sd_setImage(with: URL(string: item.thumbnail), placeholderImage: UIImage(named: "gnomeSplash"))
        imageGnome.layer.cornerRadius = imageGnome.frame.width / 2
        
        gnomesDetailViewModel.getListProfessionsItems(array: item.professions, completion: {(list :String) in
            self.worksLbl.text =  list
        })
        
        gnomesDetailViewModel.getListFriendsItems(array: item.friends, completion: {(list :String) in
            self.friendsLbl.text =  list
        })
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
