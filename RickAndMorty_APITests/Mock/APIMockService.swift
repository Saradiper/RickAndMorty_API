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
    var fetchSuccessCalled = false
    var fetchErrorCalled = false
    
    var mockedResult: RickAndMortyResponse? = nil
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?) async throws -> T {
        guard let result = mockedResult as? T else {
            fetchErrorCalled = true
            
            let error = APIError.unknown
            throw error
        }
        fetchSuccessCalled = true
        return result
    }
    
    
}
