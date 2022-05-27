//
//  BackpackView.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct BackpackView: View {
    
    @StateObject var viewModel = BackpackViewModel()
    
    var body: some View {
        
        VStack {
            
            content
            
        }.onAppear {
            
            viewModel.getPokemons()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        
        switch viewModel.state {
        case .empty:
            emptyView()
        case .loading:
            loadingView()
        case .loaded:
            loadedView()
        }
    }
    
    private func emptyView() -> some View {
        
        VStack {
            
            Spacer()
            
            Text("No Pokémon on the Backpack yet!")
            
            Spacer()
        }
    }
    
    private func loadingView() -> some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                ProgressView("Searching on the Backpack")
                    
                Spacer()
            }
            
            Spacer()
        }
    }
    
    private func loadedView() -> some View {
        
        VStack {
            
            ScrollView {
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                    
                    ForEach(viewModel.pokemons) { pokemon in
                        
                        NavigationLink(destination: PokemonDetailView(viewModel: PokemonDetailViewModel(pokemon: pokemon))) {
                            
                            BackPackCardView(name: pokemon.name,
                                             image: pokemon.url)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct BackpackView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BackpackView()
    }
}
