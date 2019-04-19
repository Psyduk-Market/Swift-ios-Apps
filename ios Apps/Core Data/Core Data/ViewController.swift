//
//  ViewController.swift
//  Core Data
//
//  Created by Thyme Nawaphanarat on 19/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        
        // This is where user initialise thier username, password and age
        newUser.setValue("Thyme", forKey: "username")
        newUser.setValue("mypass", forKey: "password")
        newUser.setValue(35, forKey: "age")
        
        do {
            
            // This will save details from user initialisation above
            try context.save()
            print("Saved")
            
        } catch {
            // When no details from user initialisation
            print("There is an error")
            
        }
        
        // This will sent a request to entity
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            // This will lopp into data storage and retrive all the username
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        print(username)
                    }
                }
            } else {
                print("No result")
            }
            
        } catch {
            // When there is nothing in data storage
            print("Cannot fecthc result")
        }
        
    }


}

