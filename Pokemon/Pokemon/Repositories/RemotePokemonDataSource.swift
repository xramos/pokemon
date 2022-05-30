//
//  RemotePokemonDataSource.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation
import Combine

class RemotePokemonDataSource {
    
    static let getPokemonURL: String = "pokemon/"
    
    private let baseURL: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURL = baseURL
        self.session = session
    }
    
    func getPokemon(id: Int) -> AnyPublisher<ServerPokemon, Error> {
        
        let apiManager = ApiManager(baseURL: baseURL, session: session)
        
        let urlRequest = getPokemonEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: - Endpoints

extension RemotePokemonDataSource {
    
    func getPokemonEndpoint(id: Int) -> URLRequest {
        
        let endpoint = "\(baseURL)\(RemotePokemonDataSource.getPokemonURL)\(id)"
        
        let url = URL(string: endpoint)
        
        let urlRequest = URLRequest(url: url!)
        
        return urlRequest
    }
}
