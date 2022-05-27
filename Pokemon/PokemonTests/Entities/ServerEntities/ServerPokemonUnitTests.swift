//
//  ServerPokemonUnitTests.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 27/5/22.
//

import XCTest
@testable import Pokemon

class ServerPokemonUnitTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        
        let serverSprite = ServerSprite(frontDefault: "url")
        let type = ServerType(name: "electric")
        let types = ServerTypes(slot: 0, type: type)
        let serverPokemon = ServerPokemon(id: 1,
                                          name: "pikachu",
                                          weight: 1,
                                          height: 2,
                                          baseExperience: 5,
                                          sprites: serverSprite,
                                          types: [types])
        
        // When
        let pokemon = serverPokemon.convertToEntity()
        
        // Then
        XCTAssertEqual(pokemon.id, serverPokemon.id)
        XCTAssertEqual(pokemon.name, serverPokemon.name)
        XCTAssertEqual(pokemon.weight, serverPokemon.weight)
        XCTAssertEqual(pokemon.height, serverPokemon.height)
        XCTAssertEqual(pokemon.experience, serverPokemon.baseExperience)
        XCTAssertEqual(pokemon.url, serverPokemon.sprites.frontDefault)
        XCTAssertEqual(pokemon.types, serverPokemon.types?.first?.type.name)
    }
}
