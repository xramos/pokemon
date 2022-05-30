//
//  BackpackViewModel.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import SwiftUI

class BackpackViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var state: BackpackViewState = .empty
    @Published public private(set) var pokemons: [Pokemon] = []
    
    // MARK: - Methods
    
    init() {
        
    }
    
    func getPokemons(){
        
        state = .loading
        
        pokemons = GetPokemonsUseCase().execute()
        
        // Sort by id
        pokemons = pokemons.sorted(by: { $0.id < $1.id })
            
        state = pokemons.isEmpty ? .empty : .loaded
    }
}
