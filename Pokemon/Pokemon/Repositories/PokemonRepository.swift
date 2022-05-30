//
//  PokemonRepository.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import Combine

protocol PokemonRepository {
    
    func getPokemon(id: Int) -> AnyPublisher<Pokemon, Error>
    
    func savePokemon(pokemon: Pokemon)
    func existsPokemon(pokemon: Pokemon) -> Bool
    func getPokemons() -> [Pokemon]
}
