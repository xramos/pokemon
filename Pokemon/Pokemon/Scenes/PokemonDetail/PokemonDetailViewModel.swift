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
    
    public private(set) var pokemon: Pokemon!
    
    // MARK: - Methods
 
    init(pokemon: Pokemon) {
        
        self.pokemon = pokemon
    }
}
