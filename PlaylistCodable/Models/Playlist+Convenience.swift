//
//  Playlist+Convenience.swift
//  PlaylistCodable
//
//  Created by jdcorn on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

// importing core data and extending playlist to allow us to create a convenience initializer
extension Playlist {
    
    // Creating a convenience initializer
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        // initializing the context
        self.init(context: context)
        self.name = name
    }
}
