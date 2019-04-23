//
//  ViewController.swift
//  Download Image from Website
//
//  Created by Thyme Nawaphanarat on 19/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bachImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/3/37/MapleStory.SVG/500px-MapleStory.SVG.png")!
        
        let request = NSMutableURLRequest(url:url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print(error!)
            } else {
                
                if let data = data {
                    DispatchQueue.main.async(execute:  {
                        if let bachImage = UIImage(data: data) {
                            self.bachImageView.image = bachImage
                        }
                    })
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }


}

