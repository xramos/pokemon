//
//  GetPokemonUseCase.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import Combine

class GetPokemonUseCase {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = PokemonRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Pokemon, Error> {
        
        return repository.getPokemon(id: id)
    }
}
