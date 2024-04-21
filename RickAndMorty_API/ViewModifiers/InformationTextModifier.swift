//
//  InformationTextModifier.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct InformationTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding(30)
    }
    
}
