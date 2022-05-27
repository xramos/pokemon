//
//  HTTPError.swift
//  Pokemon
//
//  Created by Xavier Ramos on 26/5/22.
//

import Foundation

enum HTTPError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}
