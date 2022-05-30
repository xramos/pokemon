//
//  Pokemon+Mock.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import XCTest
@testable import Pokemon

extension XCTestCase {
    
    func getPokemonMock() -> Pokemon {
        
        return Pokemon(id: 1,
                       name: "pikachu",
                       weight: 1,
                       height: 2,
                       experience: 5,
                       url: "url",
                       date: "",
                       types: "electric")
    }
    
    func getPokemonMock2() -> Pokemon {
        
        return Pokemon(id: 2,
                       name: "bulbasur",
                       weight: 4,
                       height: 1,
                       experience: 7,
                       url: "url",
                       date: "",
                       types: "plant")
    }
}
