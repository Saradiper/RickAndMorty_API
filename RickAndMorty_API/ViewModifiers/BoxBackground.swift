//
//  BoxBackground.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct BoxBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.darkGreenBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black, radius: 2)
    }
    
}
