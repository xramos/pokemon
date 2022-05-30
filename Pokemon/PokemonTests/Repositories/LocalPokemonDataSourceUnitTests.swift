//
//  LocalPokemonDataSourceUnitTests.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 30/5/22.
//

import XCTest
@testable import Pokemon

class LocalPokemonDataSourceUnitTests: XCTestCase {

    var sut: LocalPokemonDataSource!
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = LocalPokemonDataSource(dbManager: DBManager(coreDataStack: TestCoreDataStack()))
    }

    override func tearDownWithError() throws {
        
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testSavePokemon() {
        
        // Given
        let pokemon = getPokemonMock()
        
        // When
        sut.savePokemon(pokemon: pokemon)
        let pokemons = sut.getPokemons()
        
        // Then
        XCTAssertEqual(pokemons.count, 1)
    }
    
    func testExistsPokemon() {
        
        // Given
        let pokemon = getPokemonMock()
        
        // When
        sut.savePokemon(pokemon: pokemon)
        let response = sut.existsPokemon(pokemon: pokemon)
        
        // Then
        XCTAssertTrue(response)
    }
    
    func testGetPokemonsEmpty() {
        
        // When
        let pokemons = sut.getPokemons()
        
        // Then
        XCTAssertEqual(pokemons.count, 0)
    }
    
    func testGetPokemons() {
        
        // Given
        let pokemon1 = getPokemonMock()
        let pokemon2 = getPokemonMock2()
        
        // When
        sut.savePokemon(pokemon: pokemon1)
        sut.savePokemon(pokemon: pokemon2)
        let pokemons = sut.getPokemons()
        
        // Then
        XCTAssertEqual(pokemons.count, 2)
    }
}
