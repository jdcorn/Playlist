//
//  CoreDataStack.swift
//  PlaylistCodable
//
//  Created by jdcorn on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

// Creating a class called coredatastack
class CoreDataStack {
    
    // Creating and initializing the persistent container
    static let container: NSPersistentContainer = {
        
        // Creating our container and we are matching it with the name from our data model
        let container = NSPersistentContainer(name: "PlaylistCodable")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // creating a variable that allows us to access the context throughout the app
    static var context: NSManagedObjectContext { return container.viewContext}
}

