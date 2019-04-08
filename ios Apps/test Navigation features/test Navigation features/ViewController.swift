//
//  ViewController.swift
//  test Navigation features
//
//  Created by Thyme Nawaphanarat on 7/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBAction func cameraPress(_ sender: Any) {
        timer.invalidate()
    }
    
    @objc func processTimer() {
        print("A second has passed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }


}

