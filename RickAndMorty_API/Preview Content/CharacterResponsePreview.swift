//
//  CharacterResponsePreview.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


extension CharacterResponse {
    static func createDefault() -> CharacterResponse {
        let characterResponse = CharacterResponse(id: 1,
                                                  name: "name",
                                                  status: "status",
                                                  species: "species",
                                                  type: "type",
                                                  gender: "gender",
                                                  image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                                  episode: [
                                                    "https://rickandmortyapi.com/api/episode/1",
                                                    "https://rickandmortyapi.com/api/episode/2"],
                                                  url: "https://rickandmortyapi.com/api/character/1",
                                                  created: "2017-11-04T18:48:46.250Z")
        
        return characterResponse
    }
    
}
