//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @StateObject public var viewModel: PokemonDetailViewModel
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                ImageView(withURL: viewModel.pokemon.url)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text(viewModel.pokemon.name)
                        .bold()
                    
                    Text("weight: \(viewModel.pokemon.weight)")
                    
                    Text("height: \(viewModel.pokemon.height)")
                    
                    Text("Experience: \(viewModel.pokemon.experience)")
                    
                    Text("Caught on: \(viewModel.pokemon.date)")
                    
                    Spacer().frame(height: 10)
                }
                .padding([.leading, .trailing, .bottom], 10)
            }
            .pokemonBackground()
            .padding(20)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let pokemon = Pokemon(id: 0,
                              name: "",
                              weight: 0,
                              height: 0,
                              experience: 0,
                              url: "",
                              date: "",
                              types: [])
        
        PokemonDetailView(viewModel: PokemonDetailViewModel(pokemon: pokemon))
    }
}
