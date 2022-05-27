//
//  SavePokemonUseCaseUnitTests.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 27/5/22.
//

import XCTest
@testable import Pokemon

class SavePokemonUseCaseUnitTests: XCTestCase {
    
    var sut: SavePokemonUseCase?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testIsCalled() {
        
        // Given
        let repository = MockPokemonRepository()
        sut = SavePokemonUseCase(repository: repository)
        let pokemon = getPokemonMock()
        
        // When
        sut!.execute(pokemon: pokemon)
        
        // Then
        XCTAssertTrue(repository.isSavePokemonCalled)
    }
}
