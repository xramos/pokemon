//
//  Pokemon.swift
//  Pokemon
//
//  Created by Xavier Ramos on 26/5/22.
//

import Foundation

struct Pokemon {
    
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let experience: Int
    let url: String
    
    let types: [PokemonType]
}
