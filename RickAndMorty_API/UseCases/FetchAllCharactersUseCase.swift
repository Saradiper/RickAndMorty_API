//
//  FetchAllCharactersUseCase.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


struct FetchAllCharactersUseCase: FetchAllCharactersProtocol {
    var apiService: APIServiceProtocol
    var urlProvider: URLProviderProtocol
    
    init(apiService: APIServiceProtocol = APIService.shared) {
        self.apiService = apiService
        self.urlProvider = URLProvider()
    }
    
    func fetchAll() async throws -> [CharacterResponse] {
        var charactersToReturn = [CharacterResponse]()
        
        do {
            var url = URL(string: getCharactersUrl(urlProvider: urlProvider))
            repeat {
                let characterResponse = try await apiService.fetch(RickAndMortyResponse.self, url: url)
                
                if let results = characterResponse.results {
                    charactersToReturn.append(contentsOf: results)
                }
                
                if let nextCharacterPage = characterResponse.info?.next {
                    url = URL(string: nextCharacterPage)
                } else {
                    url = nil
                }
            } while url != nil
            
            return charactersToReturn
        } catch {
            throw error
        }
    }
    
    private func getCharactersUrl(urlProvider: URLProviderProtocol) -> String {
        return urlProvider.getBaseURL() + Constants.characterUrl
    }
    
}
