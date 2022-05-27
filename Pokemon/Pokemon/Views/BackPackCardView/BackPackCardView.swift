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
            
            ImageView(withURL: image)
            
            TitleView(title: name)
            
            Spacer().frame(height: 10)
            
        }.pokemonBackground()
        .padding(10)
    }
}

struct BackPackCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BackPackCardView(name: "pikachu",
                         image: "")
    }
}
