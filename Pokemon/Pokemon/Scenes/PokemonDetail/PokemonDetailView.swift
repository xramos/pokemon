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
        
        GeometryReader { proxy in
            
            HStack(alignment: .center) {
                
                Spacer()
                
                VStack {
                    
                    ImageView(withURL: viewModel.pokemon.url)
                        .frame(width: proxy.size.width * 0.7)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        TitleView(title: viewModel.pokemon.name)
                        
                        TitleValueView(title: "Weight:", value: "\(viewModel.pokemon.weight)")
                        
                        TitleValueView(title: "Height: ", value: "\(viewModel.pokemon.height)")
                        
                        TitleValueView(title: "Experience:", value: "\(viewModel.pokemon.experience)")
                        
                        TitleValueView(title: "Caught on:", value: "\(viewModel.pokemon.date)")
                        
                        TitleValueView(title: "Types:", value: "\(viewModel.pokemon.types)")
                    }
                    .padding(20)
                }
                .pokemonBackground()
                
                Spacer()
            }
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
                              types: "")
        
        PokemonDetailView(viewModel: PokemonDetailViewModel(pokemon: pokemon))
    }
}
