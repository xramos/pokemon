//
//  TabBar.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct TabBar: View {
    
    @State var activeTab: Tab = .pokemonWorld
    
    var body: some View {
        
        TabView(selection: $activeTab) {
            
            PokemonWorldView()
                .tabItem( {
                    
                    Text("PokémonWorld")
                })
                .tag(Tab.pokemonWorld)
            
            BackpackView()
                .tabItem( {
                    
                    Text("Pokedex")
                })
                .tag(Tab.backpack)
        }
    }
}
