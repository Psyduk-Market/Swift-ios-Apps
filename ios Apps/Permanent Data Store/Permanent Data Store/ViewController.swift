//
//  ViewController.swift
//  Permanent Data Store
//
//  Created by Thyme Nawaphanarat on 8/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UserDefaults.standard.set("Thyme", forKey:"name")

        let nameObject = UserDefaults.standard.object(forKey: "name")

        if let name = nameObject as?String {
            print(name)
        }

        let array = [1, 2, 3, 4]

        UserDefaults.standard.set(array, forKey: "array")

        let arrayObject = UserDefaults.standard.object(forKey: "array")

        if let array = arrayObject as? NSArray {
            print(array)
        }
    }


}

