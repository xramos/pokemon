//
//  PokemonWorldViewState.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation

enum PokemonWorldViewState: Equatable {
    
    case empty
    case loading
    case loaded
    case failed(String)
}
