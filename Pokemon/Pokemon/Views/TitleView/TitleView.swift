//
//  TitleView.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct TitleView: View {
    
    private var title: String
    
    init(title: String) {
        
        self.title = title
    }
    
    var body: some View {
        
        Group {
            
            Text(title)
                .bold()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TitleView(title: "Pikachu")
    }
}
