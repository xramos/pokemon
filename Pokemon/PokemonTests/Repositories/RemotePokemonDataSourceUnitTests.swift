//
//  RemotePokemonDataSourceUnitTests.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 30/5/22.
//

import XCTest
@testable import Pokemon

class RemotePokemonDataSourceUnitTests: XCTestCase {

    var sut: RemotePokemonDataSource?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = RemotePokemonDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {
        
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetPokemonEndpoint() {
        
        // Given
        let id = 1
        
        // When
        let response = sut!.getPokemonEndpoint(id: id)
        let value = response.url?.absoluteString.contains("http://jsonplaceholder.typicode.com/pokemon/")
        
        // Then
        XCTAssertNotNil(value)
        XCTAssertTrue(value!)
    }
}
