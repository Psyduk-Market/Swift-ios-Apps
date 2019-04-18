//
//  ViewController.swift
//  Advanced Segues
//
//  Created by Thyme Nawaphanarat on 18/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

// Passing variable from a viewcontroller to another
// Method 1
let globalVariable = "Method 1"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Method 2
    var activeRow = 0
    
    // This function is a part of UITableViewDataSource required but not use
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    // A part of UITableViewDataSource
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
    
    // This function will detect a selected by user
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Set the selected row and assign to a variable
        activeRow = indexPath.row
        
        // Link/connect to another viewController with Identifier "ToSecondPage"
        performSegue(withIdentifier: "ToSecondPage", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToSecondPage" {
            let SecondViewController = segue.destination as! SecondViewController
            
            // This will set the variable name "activeRow" in SecondViewController to be the same to variable
            // name "activeRow" in Viewcontroller (FirstViewController)
            SecondViewController.activeRow = activeRow
        }
        
    }


}

