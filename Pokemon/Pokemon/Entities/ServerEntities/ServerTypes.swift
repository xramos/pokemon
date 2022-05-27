//
//  ServerTypes.swift
//  Pokemon
//
//  Created by Xavier Ramos on 26/5/22.
//

import Foundation

struct ServerTypes: Codable {
    
    let slot: Int
    let type: ServerType
    
    func convertToEntity() -> PokemonType {
        
        return PokemonType(slot: slot,
                           name: type.name)
    }
}
