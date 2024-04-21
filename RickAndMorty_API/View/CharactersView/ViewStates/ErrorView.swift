//
//  ErrorView.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct ErrorView: View {
    @ObservedObject var viewModel: CharactersViewModel
    
    var body: some View {
            VStack {
                Image("kisspngSickSancheza")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 140)
                
                Text(viewModel.errorMessage ?? "error.message.generic".localized)
                    .foregroundColor(.black)
                    .modifier(InformationTextModifier())
                    
                Button {
                    viewModel.fetchAllCharacters()
                } label: {
                    Text("button.tryAgain".localized)
                        .font(Font.body.bold())
                        .foregroundColor(.white)
                        .modifier(BoxBackground())
                }
                .padding()
            }
        .background(
            Image("greenBackground")
                .renderingMode(.original)
                .resizable()
                .modifier(BackgroundImageModifier())
                .edgesIgnoringSafeArea(.all)
            
        )
        .modifier(BoxBackground())
    }
    
}


struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(viewModel: CharactersViewModel())
    }
}

