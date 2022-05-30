//
//  ButtonView.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct ButtonView: View {
    
    private var imageName: String
    private var text: String
    private var width: CGFloat?
    private var action: () -> Void
    
    @State private var pressed: Bool = false
    
    init(imageName: String, text: String, width: CGFloat? = 80, action: @escaping () -> Void) {
        
        self.imageName = imageName
        self.text = text
        self.width = width
        self.action = action
    }
    
    var body: some View {
        
        VStack {
            
            Image(imageName)
                .resizable()
                .frame(width: width, height: width)
            
            Spacer().frame(height: 4)
            
            Text(text)
        }
        .background(pressed ? .gray.opacity(0.3) : .white)
        .gesture(DragGesture(minimumDistance: 0.0)
            .onChanged({ _ in
                self.pressed = true
            })
                .onEnded({ _ in
                    self.pressed = false
                    self.action()
                })
        )
        /*.onTapGesture {
            
            self.action()
        }*/
    }
}

struct ButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ButtonView(imageName: "pokemon", text: "Find Pokémon") {
            
            // Nothing to do here
        }
    }
}
