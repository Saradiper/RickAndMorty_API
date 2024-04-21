//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct CharactersView: View {
    @ObservedObject var viewModel = CharactersViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                LoadingView()
            } else if viewModel.errorMessage != nil {
                ErrorView(viewModel: viewModel)
            } else {
                CharactersListView(characters: viewModel.characters)
            }
        }
    }
        
}


struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
