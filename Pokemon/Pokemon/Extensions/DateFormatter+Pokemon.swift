//
//  DateFormatter+Pokemon.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import Foundation

extension DateFormatter {
    
    static let shortTotalWithLocale: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = .current
        formatter.locale = .current
        return formatter
    }()
}
