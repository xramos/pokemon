//
//  BackPackCardView.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct BackPackCardView: View {
    
    private var name: String
    private var image: String
    
    init(name: String, image: String) {
        
        self.name = name
        self.image = image
    }
    
    var body: some View {
        
        VStack {
            
            Image("")
            
            Text(name)
            
        }.background(RoundedRectangle(cornerRadius: 4)
            .foregroundColor(Color("pokemonYellow"))
            .shadow(color: Color.gray,
                    radius: 2,
                    x: 0,
                    y: 2))
        .padding(10)
    }
}

struct BackPackCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BackPackCardView(name: "pikachu",
                         image: "")
    }
}
