//
//  GetPokemonsUseCase.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation

class GetPokemonsUseCase {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = PokemonRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> [Pokemon] {
        
        return repository.getPokemons()
    }
}
