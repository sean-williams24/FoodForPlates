//
//  DataController.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 09/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    
    // Create persistent container
    let persistentContainer: NSPersistentContainer
    
    // Convience property to access the context
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext!

    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    
    func configureContexts() {
        //create context associated with a private queue
        backgroundContext = persistentContainer.newBackgroundContext()
        
        viewContext.automaticallyMergesChangesFromParent = true
        backgroundContext.automaticallyMergesChangesFromParent = true
        
        // set to prefer background property values incase of conflict
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        // in case of conflict prefer values from persistent store
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }

    
    // Load persistent Store with convenience function
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { (storeDescrition, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            
            self.autoSaveViewContext()
            self.configureContexts()
            completion?()
        }
    }
}

extension DataController {
    func autoSaveViewContext(interval: TimeInterval = 30) {        
        guard interval > 0 else {
            print("cannot save negative autosave interval")
            return
        }
        
        // only save if changes have been made
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        
        // Save again after specified interval has elapsed
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
        }
    }
}
