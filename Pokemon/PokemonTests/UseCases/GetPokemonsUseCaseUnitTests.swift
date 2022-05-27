//
//  GetPokemonsUseCaseUnitTests.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 27/5/22.
//

import XCTest
@testable import Pokemon

class GetPokemonsUseCaseUnitTests: XCTestCase {
    
    var sut: GetPokemonsUseCase?
    
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
        sut = GetPokemonsUseCase(repository: repository)
        
        // When
        _ = sut!.execute()
        
        // Then
        XCTAssertTrue(repository.isGetPokemonsCalled)
    }
}
