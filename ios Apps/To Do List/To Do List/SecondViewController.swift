//
//  SecondViewController.swift
//  To Do List
//
//  Created by Thyme Nawaphanarat on 9/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var itemInput: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
        let itemObject = UserDefaults.standard.object(forKey: "items")
        var items:[String]
        if let tempItems = itemObject as? [String] {
            items = tempItems
            items.append(itemInput.text!)
        } else {
            items = [itemInput.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemInput.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

