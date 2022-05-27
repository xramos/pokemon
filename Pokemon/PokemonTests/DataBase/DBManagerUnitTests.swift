//
//  DBManagerUnitTests.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 27/5/22.
//

import XCTest
@testable import Pokemon

class DBManagerUnitTest: XCTestCase {
    
    var sut: DBManager!
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = DBManager(coreDataStack: TestCoreDataStack())
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        
        try super.tearDownWithError()
    }
    
    // MARK: - Tests
    
    func testSavePokemon() {
        
        // Given
        let pokemon = getPokemonMock()
        
        // When
        sut.savePokemon(pokemon: pokemon)
        let response = sut.getPokemons()
        
        // Then
        XCTAssertEqual(response.count, 1)
    }
    
    func testGetPokemon() {
        
        // Given
        let pokemon = getPokemonMock()
        
        // When
        sut.savePokemon(pokemon: pokemon)
        let response = sut.getPokemons()
        
        // Then
        XCTAssertEqual(response.count, 1)
        XCTAssertEqual(response.first?.id, pokemon.id)
        XCTAssertEqual(response.first?.name, pokemon.name)
        XCTAssertEqual(response.first?.weight, pokemon.weight)
        XCTAssertEqual(response.first?.height, pokemon.height)
        XCTAssertEqual(response.first?.experience, pokemon.experience)
        XCTAssertEqual(response.first?.url, pokemon.url)
        XCTAssertEqual(response.first?.types, pokemon.types)
    }
    
    func testExistsPokemonTrue() {
        
        // Given
        let pokemon = getPokemonMock()
        
        // When
        sut.savePokemon(pokemon: pokemon)
        let response = sut.existsPokemon(pokemon: pokemon)
        
        // Then
        XCTAssertTrue(response)
    }
    
    func testExistsPokemonFalse() {
        
        // Given
        let pokemon = getPokemonMock()
        
        // When
        let response = sut.existsPokemon(pokemon: pokemon)
        
        // Then
        XCTAssertFalse(response)
    }
}
