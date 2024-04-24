//
//  ImageView.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct ImageView: View {
    var character: CharacterResponse
    
    var body: some View {
        AsyncImage(url: URL(string: character.image)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .modifier(ImageGridModifier())

            } else if phase.error != nil {
                AsyncImage(url: URL(string: Constants.defalutImage)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .modifier(ImageGridModifier())
                    }
                }
            } else {
                ProgressView()
            }
        }
    }
    
}


struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(character: CharactersViewModel.successState().characters[0])
    }
}
