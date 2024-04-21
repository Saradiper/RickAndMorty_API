//
//  RickAndMortyResponsePreview.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


extension RickAndMortyResponse {
    static func createDefault() -> RickAndMortyResponse {
        var response = RickAndMortyResponse(info: InfoResponse(count: 1,
                                                               pages: 1,
                                                               next: nil,
                                                               prev: nil),
                                            results: [CharacterResponse.createDefault()])
        
        return response
    }
    
}
