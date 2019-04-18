//
//  LocationsTableViewController.swift
//  Memorable Places
//
//  Created by Thyme Nawaphanarat on 18/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

var locations = [Dictionary<String,String>()]
var activeLocation = -1

class LocationsTableViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // User viewDidAppear because it will run the code everytime this viewController appear on screen
    override func viewDidAppear(_ animated: Bool) {
        
        if let tempLocations = UserDefaults.standard.object(forKey: "location") as? [Dictionary<String, String>] {
            locations = tempLocations
        }
        
        if locations.count == 1 && locations[0].count == 0 {
            locations.remove(at: 0)
            locations.append(["name": "Taj Mahal", "latitude": "27.175277", "longitude": "78.04128"])
            
            UserDefaults.standard.set(locations, forKey: "locations")
        }
        activeLocation = -1
        table.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            locations.remove(at: indexPath.row)
            
            UserDefaults.standard.set(locations, forKey: "locations")
            
            table.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        if locations[indexPath.row]["name"] != nil {
            cell.textLabel?.text = locations[indexPath.row]["name"]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activeLocation = indexPath.row
        performSegue(withIdentifier: "toMap", sender: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
