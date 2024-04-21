//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import SwiftUI


struct LoadingView: View {
    
    var body: some View {
        VStack {
            Image("MortyFace")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
            
            Text("isLoading.true.characters".localized)
                .modifier(InformationTextModifier())
        }
    }
    
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
