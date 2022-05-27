//
//  ServerPokemon.swift
//  Pokemon
//
//  Created by Xavier Ramos on 26/5/22.
//

import Foundation

struct ServerPokemon: Codable {
    
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let baseExperience: Int
    
    let sprites: ServerSprite
    let types: [ServerTypes]?
    
    func convertToEntity() -> Pokemon {
        
        var pokemonTypes: [PokemonType] = []
        if let types = types {
            pokemonTypes = types.map({ $0.convertToEntity() })
        }
        
        return Pokemon(id: id,
                       name: name,
                       weight: weight,
                       height: height,
                       experience: baseExperience,
                       url: sprites.frontDefault,
                       date: "",
                       types: pokemonTypes)
    }
}
