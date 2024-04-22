//
//  APIMockService.swift
//  RickAndMorty_APITests
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import XCTest
import Foundation
@testable import RickAndMorty_API


//TODO: For testing

class APIMockService: APIServiceProtocol {
    static let shared: APIMockService = APIMockService()
    
    var mockedResult: RickAndMortyResponse?
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?) async throws -> T {
        guard let result = mockedResult as? T else {
            let error = APIError.unknown
            throw error
        }
        return result
    }
    
    
}
