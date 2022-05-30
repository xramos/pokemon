//
//  PokemonRepositoryImplementation.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import Combine
import UIKit

class PokemonRepositoryImplementation: PokemonRepository {
    
    // MARK: - Properties
    
    private let remoteDataSource: RemotePokemonDataSource
    private let localDataSource: LocalPokemonDataSource
    
    // MARK: - Methods
    
    init(remoteDataSource: RemotePokemonDataSource = RemotePokemonDataSource(),
         localDataSource: LocalPokemonDataSource = LocalPokemonDataSource()) {
        
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    // MARK: - PokemonRepository
    
    func getPokemon(id: Int) -> AnyPublisher<Pokemon, Error> {
        
        return remoteDataSource.getPokemon(id: id).map { serverPokemon -> Pokemon in
            
            // convert to entity
            let pokemon = serverPokemon.convertToEntity()
            
            return pokemon
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    func savePokemon(pokemon: Pokemon) {
        
        localDataSource.savePokemon(pokemon: pokemon)
    }
    
    func existsPokemon(pokemon: Pokemon) -> Bool {
        
        return localDataSource.existsPokemon(pokemon: pokemon)
    }
    
    func getPokemons() -> [Pokemon] {
        
        return localDataSource.getPokemons()
    }
}
