//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct CharacterDetailView: View {
    var character: CharacterResponse
    let imageSize: CGFloat = 150
    
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    ImageView(character: character)
                        .frame(width: imageSize, height: imageSize)
                    
                    Text(character.name)
                        .font(.title)
                   
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Species: \(character.species)")
                        if character.type != "" {
                            Text("Type: \(character.type)")
                        }
                        Text("Gender: \(character.gender)")
                        Text("Location: \(character.location?.name ?? "Unknown")")
                    }
                    
            }
                .padding()
                .overlay(CardGradient())
        }
    }
    
}


struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: CharactersViewModel.successState().characters[0])
    }
}
