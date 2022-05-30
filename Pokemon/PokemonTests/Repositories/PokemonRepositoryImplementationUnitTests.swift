//
//  PokemonRepositoryImplementationUnitTests.swift
//  PokemonTests
//
//  Created by Xavier Ramos on 30/5/22.
//

import XCTest
import Combine
@testable import Pokemon

class PokemonRepositoryImplementationUnitTests: XCTestCase {

    var sut: PokemonRepositoryImplementation!
    
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com/"
    
    let successStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = PokemonRepositoryImplementation()
    }

    override func tearDownWithError() throws {
        
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetPokemonOK() {
        
        // Given
        let id = 1
        let session = getPokemonSession(statusCode: successStatusCode, id: id)
        let remote = RemotePokemonDataSource(baseURL: baseUrlString, session: session)
        sut = PokemonRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut.getPokemon(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { pokemon in
                
                XCTAssertEqual(pokemon.id, 2)
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }

    func testGetPokemonKO() {
    
        // Given
        let id = 1
        let session = getPokemonSession(statusCode: failureStatusCode, id: id)
        let remote = RemotePokemonDataSource(baseURL: baseUrlString, session: session)
        sut = PokemonRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut.getPokemon(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
            }, receiveValue: { _ in
                
                // Nothing to recieve
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

// MARK: - Session

extension PokemonRepositoryImplementationUnitTests {
    
    func getPokemonSession(statusCode: Int, id: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/pokemon/\(id)")
        
        // data we expect to receive
        let data = getPokemonData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // now setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and create the URLSession from that
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getPokemonData() -> Data {
        
        let dataString = "{\"id\": 2,\"name\": \"ivysaur\",\"weight\": 130,\"height\": 10,\"base_experience\": 142,\"sprites\": {\"front_default\": \"url\"},\"types\": []}"
        return Data(dataString.utf8)
    }
}
