//
//  ViewController.swift
//  Cat year
//
//  Created by Thyme Nawaphanarat on 2/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func getCatAge(_ sender: Any) {
        
        if let age = ageTextField.text {
            if let ageAsNumber = Int(age) {
                let ageResult = ageAsNumber * 7
                
                resultLabel.text = "Your cat is " + String(ageResult) + " in cat years"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

