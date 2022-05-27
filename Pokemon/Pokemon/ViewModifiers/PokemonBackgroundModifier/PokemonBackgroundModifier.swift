//
//  PokemonBackgroundModifier.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct PokemonBackgroundModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .background(RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color("pokemonYellow"))
            .shadow(color: Color.gray,
                    radius: 2,
                    x: 0,
                    y: 2))
    }
}

extension View {
    
    func pokemonBackground() -> some View {
        
        self.modifier(PokemonBackgroundModifier())
    }
}
