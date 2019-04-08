//
//  ViewController.swift
//  Pemanent Store User Phone Number
//
//  Created by Thyme Nawaphanarat on 8/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var UserPhoneNumber: UITextField!
    @IBOutlet weak var responseToUser: UILabel!
    
    @IBAction func saveButton(_ sender: Any) {
        if (UserPhoneNumber.text != nil) {
            UserDefaults.standard.set(UserPhoneNumber.text, forKey:"number")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let phoneNumberObject = UserDefaults.standard.object(forKey: "number")
        if let phoneNumber = phoneNumberObject as? String {
            responseToUser.text = phoneNumber
            UserPhoneNumber.text = phoneNumber
            print(phoneNumber)
        }
    }
}

