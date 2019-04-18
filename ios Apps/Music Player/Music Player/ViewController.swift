//
//  ViewController.swift
//  Music Player
//
//  Created by Thyme Nawaphanarat on 18/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let audioPath = Bundle.main.path(forResource: "CrabRave", ofType: "mp3")
    
    var player = AVAudioPlayer()
    var timer = Timer()
    
    @objc func updateScrubber() {
        musicScrubber.value = Float(player.currentTime)
    }

    @IBOutlet weak var musicScrubber: UISlider!
    
    @IBAction func musicSlider(_ sender: Any) {
        player.currentTime = TimeInterval(musicScrubber.value)
        print(player.currentTime)
    }
    
    @IBOutlet weak var volume: UISlider!
    
    @IBAction func volumnSlider(_ sender: Any) {
        player.volume = volume.value
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func playButton(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
        player.pause()
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            // error
        }
    }
    
    
    @IBAction func memeButton(_ sender: Any) {
        let time = 75.0
        player.currentTime = time
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            musicScrubber.maximumValue = Float(player.duration)
            
        } catch {
            // error
        }
        
    }


}

