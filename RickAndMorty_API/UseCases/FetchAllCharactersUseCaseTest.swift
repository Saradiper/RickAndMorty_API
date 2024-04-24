//
//  FetchAllCharactersUseCaseTest.swift
//  RickAndMorty_APITests
//
//  Created by Sara Diaz Perez on 23/4/24.
//

import XCTest
@testable import RickAndMorty_API


final class FetchAllCharactersUseCaseTest: XCTestCase {
    var sut: FetchAllCharactersUseCase!
    var apiService : APIMockService!
    
    // MARK: Test lifecycle
    
    override func setUpWithError() throws {
        super.setUp()
        setupFetchAllCharactersUseCase()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupFetchAllCharactersUseCase() {
        apiService = APIMockService.shared
        
        sut = FetchAllCharactersUseCase(apiService: apiService)
    }
    
    // MARK: Spies
    
    class URLProviderSpy: URLProviderProtocol {
        var getBaseURLCalled = false
        
        func getBaseURL() -> String {
            getBaseURLCalled = true
            return "BaseURL"
        }
        
    }
    
    
    // MARK: Tests
    
    func testfetchAllSuccess() async throws {
        //Given
        apiService.mockedResult = RickAndMortyResponse.createDefault()
        
        let spy = URLProviderSpy()
        sut.urlProvider = spy
        
        //When
        let characters = try await sut.fetchAll()
        
        //Then
        XCTAssertTrue(spy.getBaseURLCalled, "fetchAll() should ask the view controller to getBaseURL()")
        XCTAssertTrue(apiService.fetchSuccessCalled, "fetchAll() should ask the view controller to fetch() and return result")
        XCTAssertNotNil(characters, "characters should not be  nil")
    }
    
    func testfetchAllError() async throws {
        //Given
        let spy = URLProviderSpy()
        sut.urlProvider = spy
        
        //When
        do {
            _ = try await sut.fetchAll()
            
            XCTFail("El método fetchAll() debería lanzar un error")
        } catch {
            //Then
            XCTAssertTrue(apiService.fetchErrorCalled, "fetchAll() debería pedir al controlador de vista que fetch() y devolver un error")
        }
    }
 

}

