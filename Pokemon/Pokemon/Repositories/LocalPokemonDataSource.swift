//
//  LocalPokemonDataSource.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation

class LocalPokemonDataSource {
    
    private let dbManager: Persistence
    
    init(dbManager: Persistence = DBManager()) {
        
        self.dbManager = dbManager
    }
    
    func savePokemon(pokemon: Pokemon) {
        
        dbManager.savePokemon(pokemon: pokemon)
    }
    
    func existsPokemon(pokemon: Pokemon) -> Bool {
        
        return dbManager.existsPokemon(pokemon: pokemon)
    }
    
    func getPokemons() -> [Pokemon] {
        
        return dbManager.getPokemons()
    }
}
