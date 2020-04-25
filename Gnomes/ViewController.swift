//
//  ViewController.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 22/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, FinderDelegate {

    //ViewModel
    var gnomesViewModel = GnomesViewModel()
    @IBOutlet var tableViewGnomes : UITableView!
    //List
    var gnomeList = [GnomeModel]()
    //Finder
    var viewFinderVC : FinderViewController!
    @IBOutlet var finderView : UIView!
    // flag animation cell
    var animationCell :Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "GNOMES"
        loader.shared.showOverlay(view: self.view)
        gnomesViewModel.fetchGnomes(completion: {(list : [GnomeModel], status : Bool) in
            DispatchQueue.main.async {
                self.gnomeList = list
                self.tableViewGnomes.reloadData()
                
                loader.shared.hideOverlayView()
                self.setFinder()
            }
        })
    }

    func setFinder () {
        // set Finder
        viewFinderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "kF") as? FinderViewController
        viewFinderVC.view.frame = finderView.bounds
        viewFinderVC.array = gnomeList
        viewFinderVC.delegate = self
        
        finderView.addSubview(viewFinderVC.view)
        self.addChild(viewFinderVC)
        viewFinderVC.didMove(toParent: self)
        
        tableViewGnomes.keyboardDismissMode = .interactive
    }
    
    // MARK:- DelegateFinder
    func arrayFilter(_ array: [GnomeModel]) {
        gnomeList = array
        tableViewGnomes.reloadData()
    }
    
}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gnomeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gnomeCell") as! GnomeCell
        let g = gnomeList[indexPath.row]
        cell.nameLbl.text = g.name
        cell.ageLbl.text = String(g.age) + " years"
        cell.imageGnome.layer.cornerRadius =  cell.imageGnome.frame.width / 2
        cell.imageGnome.sd_setImage(with: URL(string: g.thumbnail), placeholderImage: UIImage(named: "gnomeSplash"))
        
        //Animation
        cell.alpha = 0
        if !animationCell {
            UIView.animate(
                withDuration: 0.5,
                delay: 0.08 * Double(indexPath.row),
                animations: {
                    cell.alpha = 1
            })
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastVisibleIndexPath = tableView.indexPathsForVisibleRows?.last {
            if indexPath == lastVisibleIndexPath {
                animationCell = true
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "kDetailGnome") as? DetailGnome
        vc!.item = gnomeList[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
}


class GnomeCell : UITableViewCell {
    @IBOutlet var nameLbl : UILabel!
    @IBOutlet var ageLbl : UILabel!
    @IBOutlet var imageGnome : UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        
    }
    
}
