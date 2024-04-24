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
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 20) {
                    
                    ImageView(character: character)
                        .frame(width: imageSize, height: imageSize)
                    
                    Text(character.name)
                        .font(.title)
                    
                    VStack(alignment: .center, spacing: 24) {
                        VStack (alignment: .center, spacing: 8) {
                            Text("\("species".localized):")
                                .font(.title3)
                                .foregroundColor(.lightGreenBackground)
                            Text("\(character.species)")
                        }
                        
                        VStack (alignment: .center, spacing: 8) {
                            Text("\("gender".localized):")
                                .font(.title3)
                                .foregroundColor(.lightGreenBackground)
                            Text("\(character.gender)")
                        }
                        
                        VStack (alignment: .center, spacing: 8) {
                            Text("\("location".localized):")
                                .font(.title3)
                                .foregroundColor(.lightGreenBackground)
                            Text("\(character.location?.name != "unknown" ? character.location!.name! : "unknown".localized)")
                        }
                    }
                    Spacer()
            }
                .padding()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .overlay(CardGradient())
        }
    }
    
}


struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: CharactersViewModel.successState().characters[0])
    }
}
