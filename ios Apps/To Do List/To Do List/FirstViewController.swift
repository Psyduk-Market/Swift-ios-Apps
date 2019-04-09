//
//  FirstViewController.swift
//  To Do List
//
//  Created by Thyme Nawaphanarat on 9/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Must have this setup otherwise nothing will show
    @IBOutlet weak var table: UITableView!
    
    var items:[String] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItem = itemObject as? [String] {
            items = tempItem
        }
        
        table.reloadData()
    }
    
    // For deleting item on table
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            items.remove(at: indexPath.row)
            table.reloadData()
            // Save data to default
            UserDefaults.standard.set(items, forKey: "items")
        }
    }


}

