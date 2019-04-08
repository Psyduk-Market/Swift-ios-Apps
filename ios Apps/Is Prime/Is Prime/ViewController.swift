//
//  ViewController.swift
//  Is Prime
//
//  Created by Thyme Nawaphanarat on 3/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var userOutput: UILabel!
    
    @IBAction func userButton(_ sender: Any) {
        
        if let prime = userInput.text {
            let primeNumber = Int(prime)
            if let number = primeNumber {
                var isPrime = true
                
                var i = 2
                
                if number == 1 {
                    isPrime = false
                }
                
                while i < number {
                    if number % i == 0 {
                        isPrime = false
                    }
                    i += 1
                }
                
                if isPrime {
                    userOutput.text = "\(number) is a prime number!"
                } else {
                    userOutput.text = "\(number) is NOT a prime number!"
                }
            } else {
                userOutput.text = "Please enter a positive number!"
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

