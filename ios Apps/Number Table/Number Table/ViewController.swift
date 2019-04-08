//
//  ViewController.swift
//  Number Table
//
//  Created by Thyme Nawaphanarat on 7/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = [String]()
    var i = 1
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "NumberCell")
        
        // This method use the indexPath to get the numbers since it start from 0 so add 1 to each of them
        // cell.textLabel?.text = String(indexPath.row + 1)
        
        while i <= 50 {
            array.append(String(i))
            i += 1
        }
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

