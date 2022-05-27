//
//  ExistsPokemonUseCaseUnitTests.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 27/5/22.
//

import XCTest
@testable import Pokemon

class ExistsPokemonUseCaseUnitTests: XCTestCase {
    
    var sut: ExistsPokemonUseCase?
    
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
        sut = ExistsPokemonUseCase(repository: repository)
        let pokemon = getPokemonMock()
        
        // When
        _ = sut!.execute(pokemon: pokemon)
        
        // Then
        XCTAssertTrue(repository.isExistsPokemonCalled)
    }
}
