//
//  DBPokemonUnitTests.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 27/5/22.
//

import XCTest
@testable import Pokemon

class DBPokemonUnitTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let id: Int = 1
        let dbPokemon = DBPokemon(context: TestCoreDataStack().managedContext)
        
        dbPokemon.id = Int64(id)
        dbPokemon.name = "pikachu"
        dbPokemon.weight = Int16(1)
        dbPokemon.height = Int16(2)
        dbPokemon.experience = Int16(5)
        dbPokemon.url = "url"
        dbPokemon.date = "date"
        dbPokemon.types = "electric"
        
        // When
        let pokemon = dbPokemon.convertToEntity()
        
        // Then
        XCTAssertNotNil(pokemon)
        XCTAssertEqual(dbPokemon.id, Int64(pokemon.id))
        XCTAssertEqual(dbPokemon.name, pokemon.name)
        XCTAssertEqual(dbPokemon.weight, Int16(pokemon.weight))
        XCTAssertEqual(dbPokemon.height, Int16(pokemon.height))
        XCTAssertEqual(dbPokemon.experience, Int16(pokemon.experience))
        XCTAssertEqual(dbPokemon.url, pokemon.url)
        XCTAssertEqual(dbPokemon.date, pokemon.date)
        XCTAssertEqual(dbPokemon.types, pokemon.types)
    }
}
