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
        
        // NSManagedObjectContext (address of its location)
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        /*
        
        // This is where user initialise thier username, password and age
        newUser.setValue("Tom", forKey: "username")
        newUser.setValue("mypass", forKey: "password")
        newUser.setValue(4, forKey: "age")
        
        do {
            
            // This will save details from user initialisation above
            try context.save()
            print("Saved")
            
        } catch {
            // When no details from user initialisation
            print("There is an error")
            
        }
 
        */
        
        // This will sent a request to entity
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        // Advanced Core Data
        // The line below contain NSPredicate can use to get data from storage
//        request.predicate = NSPredicate(format: "username = %@", "Harvey")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            // This will lopp into data storage and retrive all the username
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        
//                        context.delete(result)
//
//                        do {
//
//                            try context.save()
//
//                        } catch {
//                            print("Failed to save")
//                        }
                        
                        // This is to edit/change the argument from "request.predicate" to what you need
                        // In this case argument is "Tom" that under username as string
                        // The line below will check if there is a username called "Tom"
                        // If there is one it will set "Tom" to "Harvey" and the rest of details will remain
                        // the same
                        /*
                        result.setValue("Harvey", forKey: "username")
                        
                        do {
                            
                            try context.save()
                            
                        } catch {
                            print("Failed to save")
                        }
                        */
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

/* Instruction:
 - Use predicate to set a condition for what you want from core data
 - .fetch() is to send request to core data and expect data return from it
 - From returned data from core data, to access particular attribute from an entity use .value(forKey: "***")
 - delete(), save() are part of NSManagedObjectContext
*/
