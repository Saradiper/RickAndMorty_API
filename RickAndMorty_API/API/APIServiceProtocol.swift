//
//  APIServiceProtocol.swift
//  RickAndMorty_API
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


protocol APIServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?) async throws -> T
    
}
