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
            
            Image("")
            
            Text(name)
            
            Text("weight: \(weight)")
            
            Text("height: \(height)")
            
        }.background(RoundedRectangle(cornerRadius: 4)
            .foregroundColor(Color("pokemonYellow"))
            .shadow(color: Color.gray,
                    radius: 2,
                    x: 0,
                    y: 2))
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
