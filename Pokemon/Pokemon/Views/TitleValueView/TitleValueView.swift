//
//  TitleValueView.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct TitleValueView: View {
    
    private var title: String
    private var value: String
    
    init(title: String, value: String) {
        
        self.title = title
        self.value = value
    }
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 4) {
            
            Text(title)
                .font(.headline)
                .bold()
            
            Text(value)
                .font(.subheadline)
        }
    }
}

struct TitleValueView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TitleValueView(title: "Pikachu",
                       value: "Pika")
    }
}
