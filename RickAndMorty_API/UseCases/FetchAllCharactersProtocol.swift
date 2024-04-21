//
//  FetchAllCharactersProtocol.swift
//  RickAndMorty_API
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


protocol FetchAllCharactersProtocol {
    func fetchAll() async throws -> [CharacterResponse]
    
}
