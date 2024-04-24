//
//  ViewModelIntegrationTest.swift
//  RickAndMorty_APITests
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import XCTest
import Combine
@testable import RickAndMorty_API


@MainActor
final class ViewModelIntegrationTest: XCTestCase {
    var sut : CharactersViewModel!
    var apiService : APIMockService!
    var subscriptions = Set<AnyCancellable>()
    
    // MARK: Test lifecycle
    
    override func setUpWithError() throws {
        super.setUp()
        setupCharactersViewModel()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCharactersViewModel() {
        apiService = APIMockService.shared
        
        let fetchAllCharacterUseCase = FetchAllCharactersUseCase(apiService: apiService)
        
        sut = CharactersViewModel(fetchAllCharactersUseCase: fetchAllCharacterUseCase)
    }
    
    // MARK: Tests
    
    @MainActor
    func testFetchCharactersSuccess() throws {
        //Given
        apiService.mockedResult = RickAndMortyResponse.createDefault()
        
        //When
        sut.fetchAllCharacters()
        let promise = expectation(description: "getting characters")
        promise.assertForOverFulfill = false
        
        sut.$characters.sink { characters in
            if !characters.isEmpty {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 14)
        
        //Then
        XCTAssertEqual(sut.characters.count, 1, "ProcessCharacters() should be called, characters should be mocked")
        XCTAssertNil(sut.errorMessage, "errorMessage should be nil")
        XCTAssertFalse(sut.isLoading, "ProcessCharacters() should be called, isLoading should be nil")
    }
    
    @MainActor
    func testFetchCharactersError() throws {
        //Given
        apiService.mockedResult = nil
        
        //When
        sut.fetchAllCharacters()
        
        let promise = expectation(description: "show error message")
        promise.assertForOverFulfill = false
        sut.$characters.sink { characters in
            if !characters.isEmpty {
                XCTFail()
            }

        }.store(in: &subscriptions)

        sut.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)

        wait(for: [promise], timeout: 14)
        
        //Then
        XCTAssertEqual(sut.characters.count, 0, "characters should be nil")
        XCTAssertNotNil(sut.errorMessage, " ProcessError() should be called,errorMessage should be not nil")
        XCTAssertFalse(sut.isLoading, "ProcessCharacters() should be called, isLoading should be nil")
    }
    
}
