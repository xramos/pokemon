//
//  DBPokemonType.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import CoreData

extension DBPokemonType {
    
    func convertToEntity() -> PokemonType {
        
        return PokemonType(slot: Int(slot),
                           name: name ?? "")
    }
}
