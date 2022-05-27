//
//  CoreDataStack.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let modelName = "Model"
    static let sharedInstance = CoreDataStack()
    
    lazy var storeContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = {
        
        return storeContainer.viewContext
    }()
    
    func saveContext() {
        
        guard managedContext.hasChanges else {
            return
        }
        
        do {
            
            try managedContext.save()
            
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}
