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
            
            Text(name)
                .bold()
            
            Spacer().frame(height: 4)
            
            Text("weight: \(weight)")
            
            Spacer().frame(height: 4)
            
            Text("height: \(height)")
            
            Spacer().frame(height: 10)
            
        }.pokemonBackground()
        .padding(10)
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
