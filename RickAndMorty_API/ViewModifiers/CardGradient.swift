//
//  CardGradient.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct CardGradient: View {
    var myGradient = Gradient(
        colors: [
            .lightBlueBackground,
            .lightGreenBackground
        ]
    )
    
    var body: some View {
        Rectangle()
            .stroke(
                LinearGradient(
                    gradient: myGradient,
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                lineWidth: 3
            )
    }
    
}
