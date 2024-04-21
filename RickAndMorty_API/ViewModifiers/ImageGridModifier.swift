//
//  ImageGridModifier.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct ImageGridModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 130, height: 130)
    }
    
}
