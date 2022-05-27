//
//  PokemonWorldViewModel.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import SwiftUI
import Combine

class PokemonWorldViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var state: PokemonWorldViewState = .empty
    @Published public private(set) var pokemon: Pokemon?
    @Published public private(set) var isCatched: Bool = false
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    init() {
        
        if pokemon != nil {
            
            state = .loaded
        }
    }
    
    func getPokemon() {
        
        state = .loading
        
        cancellable = GetPokemonUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    self.state = .loaded
                    self.isPokemonCatched()
                case .failure(let error):
                    self.state = .failed("Get Pokémon Failed!")
                    print("Get Pokemon failed \(error), \(error.localizedDescription)")
                }
                
            }, receiveValue: { (pokemon: Pokemon) in
                
                self.pokemon = pokemon
            })
    }
    
    func isPokemonCatched() {
        
        isCatched = ExistsPokemonUseCase().execute(pokemon: pokemon!)
    }
    
    func caughtPokemon() {

        if !isCatched {
            
            SavePokemonUseCase().execute(pokemon: pokemon!)
            
            // Show message pokemon caught!
            
        }
    }
}
