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
        
        // Date when the pokemon has been caught!
        let dateFormatter = DateFormatter.shortTotalWithLocale
        let dateString = dateFormatter.string(from: Date())
        
        // Create DBPokemon
        let dbPokemon = DBPokemon(context: coreDataStack.managedContext)
        dbPokemon.id = Int64(pokemon.id)
        dbPokemon.name = pokemon.name
        dbPokemon.weight = Int16(pokemon.weight)
        dbPokemon.height = Int16(pokemon.height)
        dbPokemon.experience = Int16(pokemon.experience)
        dbPokemon.url = pokemon.url
        dbPokemon.date = dateString
        
        // Create and assign DBPokemonTypes
        for type in pokemon.types {
            let dbPokemonType = DBPokemonType(context: coreDataStack.managedContext)
            dbPokemonType.id = UUID()
            dbPokemonType.slot = Int16(type.slot)
            dbPokemonType.name = type.name
            dbPokemonType.pokemon = dbPokemon
        }
        
        // Save DBEntitites
        coreDataStack.saveContext()
    }
    
    func existsPokemon(pokemon: Pokemon) -> Bool {
        
        let pokemonId = Int64(pokemon.id)
        
        let fetchRequest = NSFetchRequest<DBPokemon>(entityName: "DBPokemon")
        fetchRequest.predicate = NSPredicate(format: "id==\(pokemonId)")
        
        do {
            
            let dbPokemons = try coreDataStack.managedContext.fetch(fetchRequest)
            
            return dbPokemons.first != nil
            
        } catch let error as NSError {
            
            print("Could not fetch pokemon with \(pokemonId). \(error), \(error.userInfo)")
            
            return false
        }
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
