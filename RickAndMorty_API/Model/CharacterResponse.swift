//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import UIKit
import Combine


struct CharacterResponse: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location?
    let location: Location?
    let image: String
    let episode: [String] //url
    let url: String
    let created: String
    
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: Location? = nil, location: Location? = nil, image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
    
}
