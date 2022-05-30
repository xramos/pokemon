//
//  TabBar.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct TabBar: View {
    
    @State var activeTab: Tab = .pokemonWorld
    
    init() {

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(named: "pokemonYellow")
        tabBarAppearance.shadowColor = UIColor.gray
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.white
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        
        TabView(selection: $activeTab) {
            
            PokemonWorldView()
                .tabItem( {
                    
                    Label("PokémonWorld", systemImage: "globe.europe.africa")
                })
                .tag(Tab.pokemonWorld)
            
            BackpackView()
                .tabItem( {
                    
                    Label("Pokédex", systemImage: "magazine")
                })
                .tag(Tab.backpack)
        }
    }
}
