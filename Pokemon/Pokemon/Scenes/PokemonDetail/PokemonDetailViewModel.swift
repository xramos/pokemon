//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    
    public private(set) var pokemon: Pokemon = Pokemon(id: 0,
                                                       name: "",
                                                       weight: 0,
                                                       height: 0,
                                                       experience: 0,
                                                       url: "",
                                                       date: "",
                                                       types: "")
    
    // MARK: - Methods
 
    init(pokemon: Pokemon) {
        
        self.pokemon = pokemon
    }
}
