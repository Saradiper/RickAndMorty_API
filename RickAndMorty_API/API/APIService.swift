//
//  APIService.swift
//  RickAndMorty_API
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


struct APIService: APIServiceProtocol {
    static let shared: APIService = APIService()
    
    private init() { }
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?) async throws -> T {
        
        guard let url = url else {
            throw APIError.badURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                throw APIError.badResponse(statusCode: response.statusCode)
            }
            
            let decoder = JSONDecoder()
            let decodeResponse = try decoder.decode(type, from: data)
            
            return decodeResponse
        } catch {
            if let error = error as? URLError {
                throw APIError.url(error)
            } else if let error = error as? DecodingError {
                throw APIError.parsing(error)
            }
            throw APIError.unknown
        }
    }
    
}
