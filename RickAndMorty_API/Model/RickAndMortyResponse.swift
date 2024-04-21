//
//  RickAndMortyResponse.swift
//  RickAndMorty_API
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import UIKit
import Combine


struct RickAndMortyResponse: Codable, Equatable {
    var info: InfoResponse?
    var results: [CharacterResponse]?
    
}
