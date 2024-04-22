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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiService = APIMockService.shared
        
        let fetchAllCharacterUseCase = FetchAllCharactersUseCase(apiService: apiService)
        
        sut = CharactersViewModel(fetchAllCharactersUseCase: fetchAllCharacterUseCase)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor
    func testFetchCharacters() throws {
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
        XCTAssertEqual(sut.characters.count, 1)
        XCTAssertNil(sut.errorMessage)
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
        XCTAssertEqual(sut.characters.count, 0)
    }
    
}
