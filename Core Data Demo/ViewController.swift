//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Zulwiyoza Putra on 10/5/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        //Set values for attributes in Users entity
        
        newUser.setValue("putra", forKey: "username")
        newUser.setValue("pasword", forKey: "password")
        newUser.setValue(21, forKey: "age")
        
        //Saving values into context
        
        do {
            try context.save()
            print("an user saved")
        } catch {
            print("invalid attributes")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
        } catch {
            print("Fetch error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

