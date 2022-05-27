//
//  PokemonWorldView.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct PokemonWorldView: View {
    
    @StateObject var viewModel = PokemonWorldViewModel()
    
    var body: some View {
        
        VStack {
            
            content
        }
        .toast(message: viewModel.messageToast,
               isShowing: $viewModel.showToast)
    }
    
    @ViewBuilder
    private var content: some View {
        
        switch viewModel.state {
        case .empty:
            emptyView()
        case .loading:
            loadingView()
        case .failed(let errorMessage):
            failedView(errorMessage: errorMessage)
        case .loaded:
            loadedView()
        }
    }
    
    private func emptyView() -> some View {
        
        VStack {
            
            Text("""
                \"Hello there!
                Welcome to the world of Pokémon!
                My name is Oak!
                People call me the Pokémon Prof!
                This world is inhabited by creatures called Pokémon! For some people, Pokémon are pets. Other use them for fights. Myself… I study Pokémon as a profession.
                
                Your very own Pokémon legend is about to unfold!
                A world of dreams and adventures with Pokémon awaits! Let's go!\"
                """)
            
            Spacer()
            
            ButtonView(imageName: "pokeball",
                       text: "Find Pokémon") {
                
                self.viewModel.getPokemon()
            }
            
            Spacer()
        }
        .padding(16)
    }
    
    private func loadingView() -> some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                ProgressView("Finding Pokémon")
                    
                Spacer()
            }
            
            Spacer()
        }
    }
    
    private func failedView(errorMessage: String) -> some View {
        
        VStack {
            
            Spacer()
            
            Text(errorMessage)
            
            Spacer().frame(height: 16)
            
            ButtonView(imageName: "pokeball",
                       text: "Find Pokémon") {
                
                self.viewModel.getPokemon()
            }
            
            Spacer()
        }
        .padding(16)
    }
    
    private func loadedView() -> some View {
        
        VStack {
            
            Spacer()
            
            PokemonCardView(name: viewModel.pokemon?.name ?? "",
                            image: viewModel.pokemon?.url ?? "",
                            weight: viewModel.pokemon?.weight ?? 0,
                            height: viewModel.pokemon?.height ?? 0)
            
            Spacer()
            
            HStack {
                
                ButtonView(imageName: "pokeball",
                           text: "Find Pokémon",
                           width: 60) {
                    
                    self.viewModel.getPokemon()
                }
                
                Spacer().frame(width: 10)
                
                ButtonView(imageName: "pokedex",
                           text: "Catch Pokémon",
                           width: 60) {
                    
                    self.viewModel.caughtPokemon()
                }
                .disabled(viewModel.isCatched ? true : false)
                .blur(radius: viewModel.isCatched ? 4 : 0)
            }
            
            Spacer()
        }
        .padding(16)
    }
}

struct PokemonWorldView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PokemonWorldView()
    }
}
