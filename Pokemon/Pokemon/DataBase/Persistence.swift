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
     Get all pokemons from DB
     */
    func getPokemons() -> [Pokemon]
}
