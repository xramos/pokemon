//
//  MockPokemonRepository.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import Combine
@testable import Pokemon

class MockPokemonRepository: PokemonRepository {
    
    var isGetPokemonCalled = false
    var isSavePokemonCalled = false
    var isExistsPokemonCalled = false
    var isGetPokemonsCalled = false
    
    func getPokemon() -> AnyPublisher<Pokemon, Error> {
        
        self.isGetPokemonCalled = true
        
        return Just(Pokemon(id: 1, name: "Pikachu", weight: 1, height: 2, experience: 5, url: "url", date: "date", types: "electric"))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func savePokemon(pokemon: Pokemon) {
        
        self.isSavePokemonCalled = true
    }
    
    func existsPokemon(pokemon: Pokemon) -> Bool {
        
        self.isExistsPokemonCalled = true
        
        return true
    }
    
    func getPokemons() -> [Pokemon] {
        
        self.isGetPokemonsCalled = true
        
        return []
    }
}
