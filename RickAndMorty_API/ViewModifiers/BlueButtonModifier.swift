//
//  BlueButtonModifier.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct BlueButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 270)
            .padding()
            .background(.darkBlueBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .lightBlueBackground, radius: 6)
    }
    
}
