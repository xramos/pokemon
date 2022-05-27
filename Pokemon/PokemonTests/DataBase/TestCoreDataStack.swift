//
//  TestCoreDataStack.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import CoreData
@testable import Pokemon

class TestCoreDataStack: CoreDataStack {
    
    private let modelName = "Model"
    
    override init() {
        
        super.init()
        
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        
        let container = NSPersistentContainer(name: modelName)
        
        container.persistentStoreDescriptions = [persistentStoreDescription]
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        storeContainer = container
    }
}
