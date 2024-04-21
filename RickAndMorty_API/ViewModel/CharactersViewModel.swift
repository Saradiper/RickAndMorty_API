//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


class CharactersViewModel: ObservableObject {
    @Published var characters: [CharacterResponse]
    @Published var decodeResponse: RickAndMortyResponse? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let fetchAllCharactersUseCase: FetchAllCharactersProtocol
    
    init(characters: [CharacterResponse] = [], fetchAllCharactersUseCase: FetchAllCharactersProtocol = FetchAllCharactersUseCase()) {
        self.characters = characters
        self.fetchAllCharactersUseCase = fetchAllCharactersUseCase
        fetchAllCharacters()
    }
    
    func fetchAllCharacters() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let charactersResponse = try await fetchAllCharactersUseCase.fetchAll()
                await ProcessCharacters(characters: charactersResponse)
            } catch {
                if let apiError = error as? APIError {
                    await ProcessError(error: apiError)
                }
            }
        }
    }
    
    @MainActor
    private func ProcessCharacters(characters: [CharacterResponse]) {
        self.characters = characters
        isLoading = false
    }
    
    @MainActor
    private func ProcessError(error: APIError) {
        self.errorMessage = error.localizedDescription
        isLoading = false
    }
    
    //Preview helpers
    static func errorState() -> CharactersViewModel {
        let fetcher = CharactersViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    
    static func successState() -> CharactersViewModel {
        let fetcher = CharactersViewModel()
        fetcher.characters = [CharacterResponse.createDefault()]
        return fetcher
    }
    
}
