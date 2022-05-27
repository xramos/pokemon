//
//  Persistence.swift
//  Pokemon
//
//  Created by Xavier Ramos on 26/5/22.
//

import Foundation

protocol Persistence {
    
    /**
     Save pokemon to DB
     */
    func savePokemon(pokemon: Pokemon)
    
    /**
     Check if this pokemon already has been caught
     */
    func existsPokemon(pokemon: Pokemon) -> Bool
    
    /**
     Get all pokemons from DB
     */
    func getPokemons() -> [Pokemon]
}
