//
//  BackgroundImageModifier.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct BackgroundImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 500)
    }
    
}
