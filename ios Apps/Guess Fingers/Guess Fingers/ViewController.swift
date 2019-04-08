//
//  ViewController.swift
//  Guess Fingers
//
//  Created by Thyme Nawaphanarat on 3/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userInput: UITextField!
    
    @IBOutlet weak var userOutput: UILabel!
    
    @IBAction func getResult(_ sender: Any) {
        let result = String(arc4random_uniform(6))
        
        if userInput.text == result {
            userOutput.text = "You guessed it RIGHT!"
        } else {
            userOutput.text = "Guessed wrong! It was \(result)."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

