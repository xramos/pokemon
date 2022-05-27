//
//  DBManager.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import CoreData

class DBManager: Persistence {
    
    // MARK: - Properties
    
    let coreDataStack: CoreDataStack
    
    // MARK: - Methods
    
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        
        self.coreDataStack = coreDataStack
    }
    
    // MARK: - Persistence
    
    func savePokemon(pokemon: Pokemon) {
        
        let dbPokemon = DBPokemon(context: coreDataStack.managedContext)
        dbPokemon.id = Int64(pokemon.id)
        dbPokemon.name = pokemon.name
        dbPokemon.weight = Int16(pokemon.weight)
        dbPokemon.height = Int16(pokemon.height)
        dbPokemon.experience = Int16(pokemon.experience)
        dbPokemon.url = pokemon.url
        
        for type in pokemon.types {
            let dbPokemonType = DBPokemonType(context: coreDataStack.managedContext)
            dbPokemonType.id = UUID()
            dbPokemonType.slot = Int16(type.slot)
            dbPokemonType.name = type.name
            dbPokemonType.pokemon = dbPokemon
        }
        
        coreDataStack.saveContext()
    }
    
    func getPokemons() -> [Pokemon] {
        
        var pokemons: [Pokemon] = []
        
        let fetchRequest = NSFetchRequest<DBPokemon>(entityName: "DBPokemon")
        
        do {
            
            let dbPokemons = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbPokemon in dbPokemons {
                let pokemon = dbPokemon.convertToEntity()
                pokemons.append(pokemon)
            }
            
        } catch let error as NSError {
            
            print("Could not fetch pokemons. \(error), \(error.userInfo)")
        }
        
        return pokemons
    }
}
