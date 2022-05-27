//
//  DBPokemon.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import CoreData

extension DBPokemon {
    
    func convertToEntity() -> Pokemon {
        
        return Pokemon(id: Int(id),
                       name: name ?? "",
                       weight: Int(weight),
                       height: Int(height),
                       experience: Int(experience),
                       url: url ?? "",
                       date: date ?? "",
                       types: types ?? "")
    }
}
