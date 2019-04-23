//
//  ViewController.swift
//  API Demo
//
//  Created by Thyme Nawaphanarat on 19/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func submitButton(_ sender: Any) {
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + textField.text!.replacingOccurrences(of: " ", with: "%20") + "&appid=1d0b60e561eb1687af9ded59421d353c") {
        
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                } else {
                    
                    if let urlContent = data {
                        
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
//                            print(jsonResult)
                            print(jsonResult["name"]!!)
                            
                            //                   |Access Json @ weather and get its whole content| {} mean dict and look where "description" and get it value then set the type of value to String
                            if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                DispatchQueue.main.sync {
                                    self.label.text = description
                                }
                                print(description)
                            }
                            
                        } catch {
                            
                            print("Json Processing Failed")
                            
                        }
                        
                    }
                    
                }
                
            }
            
            task.resume()
        } else {
            
            label.text = "Cannot find weather for that city, please check if the city you type in is correct or exist"
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

