//
//  ViewController.swift
//  Egg Timer
//
//  Created by Thyme Nawaphanarat on 7/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var seconds = 300
    var pause = true
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    @IBAction func pauseButton(_ sender: Any) {
        pause = true
        timer.invalidate()
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        pause = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func deTimer(_ sender: Any) {
        if seconds >= 10 {
            seconds -= 10
        }
        
        if seconds >= 10 && pause == true {
            timerLabel.text = String(seconds)
        }
    }
    
    
    @IBAction func inTimer(_ sender: Any) {
        seconds += 10
        if pause == true {
            timerLabel.text = String(seconds)
        }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        seconds = 301
    }
    
    @objc func processTimer() {
        if seconds > 0 {
            seconds -= 1
            timerLabel.text = String(seconds)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

