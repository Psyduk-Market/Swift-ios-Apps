//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Thyme Nawaphanarat on 12/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    // Web view interface on story board.
    @IBOutlet weak var webView: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        /*
        // Initialised url.
        let myURL = URL(string: "https://www.stackoverflow.com")!
        
        // Initialised url request
        let myRequest = URLRequest(url: myURL)
        
        // Load url to web view
        webView.load(myRequest)
        */
        
//        if let url = URL(string: "https://www.stackoverflow.com")! {
//            let request = NSMutableURLRequest(url: url)
//            let task = URLSession.shared().dataTask(with:request as URLRequest) {
//                data, response, error in
//
//                if let error = error {
//                    print(error)
//                } else {
//                    if let unwrappedData = data {
//                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
//                        print(dataString)
//                    }
//                }
//            }
//            task.resume()
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "https://www.stackoverflow.com") {
            
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    
                    print(error!)
                    
                } else {
                    
                    if let unwrappedData = data {
                        
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString!)
                        
                        DispatchQueue.main.sync(execute: {
                            
                            // Update UI
                            
                        })
                        
                        
                    }
                    
                    
                }
                
                
            }
            
            task.resume()
            
        }
    }


}

