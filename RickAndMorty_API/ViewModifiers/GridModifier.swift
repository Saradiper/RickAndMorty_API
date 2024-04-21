//
//  GridModifier.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct GridModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical)
            .frame(width: 170, height: 200)
    }
    
}
