//
//  PlaylistController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    func add(playlistWithName name: String) {
        
        // Creating a new playlist using the name from the parameter, we are initializing it with our coredatastack.context, you just cannot see that happening here because we set a default value in our convenience initializer
        _ = Playlist(name: name)
        
        // Making sure that our changes to the managed object context are saved to persist
        saveToPersistentStore()
        
        
    }
    
    func delete(playlist: Playlist) {
        let moc = CoreDataStack.context
        
        // going to our Managed Object Context, and deleting the store
        moc.delete(playlist)
        
        // ensuring that the playlist has been deleted from our persistent store
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            
            // trying to save what is in our moc to our persistent store
            try moc.save()
        } catch {
            
            // catching the error from the do try catch block and printing what the error is
            print("There was a problem saving to persistent store: \(error.localizedDescription)")
        }
    }
    
   
    // MARK: - Properties
    
    // making our playlist array a computed property
    var playlists: [Playlist] {
        
        // Creating our fetch request and specifying that it will be of type playlist
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        
        // Returning our array of playlists, nil coelescing to an empty array if the request didn't work
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
}
