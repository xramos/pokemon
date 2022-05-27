//
//  ToastView.swift
//  Pokemon
//
//  Created by Xavier Ramos on 27/5/22.
//

import SwiftUI

struct ToastView: ViewModifier {
    
    static let short: TimeInterval = 2
    static let long: TimeInterval = 3.5
    
    let message: String
    @Binding var isShowing: Bool
    let duration: TimeInterval
    
    func body(content: Content) -> some View {
        
        ZStack {
            
            content
            
            toastView
        }
    }
    
    private var toastView: some View {
        
        VStack {
            
            Spacer()
            
            if isShowing {
                
                Group {
                    
                    Text(message)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .padding(8)
                }
                .background(Color.black.opacity(0.588))
                .cornerRadius(8)
                .onTapGesture {
                    
                    isShowing = false
                }
                .onAppear() {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        
                        isShowing = false
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 18)
        .animation(.linear(duration: 0.3), value: isShowing)
        .transition(.opacity)
    }
}

extension View {
    
    func toast(message: String, isShowing: Binding<Bool>, duration: TimeInterval = ToastView.short) -> some View {
        
        self.modifier(ToastView(message: message,
                                isShowing: isShowing,
                                duration: duration))
    }
}
