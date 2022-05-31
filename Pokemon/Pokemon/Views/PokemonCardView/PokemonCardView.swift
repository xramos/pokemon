//
//  PokemonCardView.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct PokemonCardView: View {
    
    private var name: String
    private var image: String
    private var weight: Int
    private var height: Int
    
    init(name: String, image: String, weight: Int, height: Int) {
        
        self.name = name
        self.image = image
        self.weight = weight
        self.height = height
    }
    
    var body: some View {
        
        VStack {
            
            ImageView(withURL: image)
            
            VStack(alignment: .leading, spacing: 4) {
                
                TitleView(title: name)
                
                TitleValueView(title: "Weight:",
                               value: "\(weight)")
                
                TitleValueView(title: "Height:",
                               value: "\(height)")
            }
            
            Spacer().frame(height: 10)
            
        }.pokemonBackground()
        .padding(5)
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PokemonCardView(name: "pikachu",
                        image: "",
                        weight: 1,
                        height: 1)
    }
}
