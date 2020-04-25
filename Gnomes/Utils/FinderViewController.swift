//
//  FinderViewController.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 23/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//

import UIKit

protocol FinderDelegate{
    func arrayFilter(_ array: [GnomeModel])
}

class FinderViewController: UIViewController {
    
    var array = [GnomeModel]()
    var filterText : String!
    var delegate: FinderDelegate?
    var showKeyboard : Bool! = false
    @IBOutlet var finderTxt : UITextField!
    
    override func viewDidLoad() {
        finderTxt.delegate = self
        //finderTxt.placeholder = NSLocalizedString("title_buscador_header", comment: "")
        
        addToolBar(textField: finderTxt)
        
        if showKeyboard {
            finderTxt.becomeFirstResponder()
        }
        
    }
    
    func searching (text : String) {
        var listPlaces = [GnomeModel]()
        if text.count > 0 {
            listPlaces = array.filter({
                ($0.name.lowercased().contains(text))
            })
        }else {
            listPlaces = array
        }
        
        self.delegate?.arrayFilter(listPlaces)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(textField.text!)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        searching(text: updatedString!)
        
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        finderTxt.text = ""
        searching(text: "")
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        self.view.endEditing(true)
        return true
    }
}

extension UIViewController: UITextFieldDelegate {
    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        //toolBar.tintColor = Colors.colorApp
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))
        //var cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: "cancelPressed")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()

        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed(){
        view.endEditing(true)
    }
    func cancelPressed(){
        view.endEditing(true) // or do something
    }
}
