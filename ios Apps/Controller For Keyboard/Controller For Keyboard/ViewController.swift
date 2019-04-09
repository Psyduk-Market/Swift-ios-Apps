//
//  ViewController.swift
//  Controller For Keyboard
//
//  Created by Thyme Nawaphanarat on 9/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // By adding UITextViewDelegate will enable controller to have control text field

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // This will hide the keyboard then tap on screen
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        // Note: "-> Bool" Indicate the function must return Bool
        textField.resignFirstResponder()
        return true
    }

}

