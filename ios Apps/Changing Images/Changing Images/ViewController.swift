//
//  ViewController.swift
//  Changing Images
//
//  Created by Thyme Nawaphanarat on 15/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func FateButton(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    @IBAction func SlideButton(_ sender: Any) {
        image.center = CGPoint(x:image.center.x - 500, y:image.center.y)
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
    }
    
    @IBAction func GrowButton(_ sender: Any) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1, animations: {
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        })
    }
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    var counter = 1
    var play = false
    var timer = Timer()
    
    @objc func animate() {
        image.image = UIImage(named: "frame_0\(counter)_delay-0.1s.gif")
        counter += 1
        if counter > 10 {
            counter = 1
        }
    }
    
    @IBAction func goButton(_ sender: Any) {
        if play {
            timer.invalidate()
            button.setTitle("Painting", for: [])
            play = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            button.setTitle("Pause", for: [])
            play = true
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

