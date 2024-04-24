//
//  CharactersListViewTest.swift
//  RickAndMorty_APITests
//
//  Created by Sara Diaz Perez on 22/4/24.
//

import XCTest
import SwiftUI
@testable import RickAndMorty_API


@MainActor
final class CharactersListViewTest: XCTestCase {
    var sut: CharactersListView!
    var mockCharacters: [CharacterResponse] = []

    // MARK: Test lifecycle
    
    override func setUpWithError() throws {
        super.setUp()
        setupCharactersListView()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCharactersListView() {
        mockCharacters = [CharacterResponse.createDefault()]
        
        sut = CharactersListView(characters: mockCharacters)
    }
    
    // MARK: Tests
    
    func testCharacterListHaveCharacters() {
        //Given
        
        // When
        let navigationViews = sut.body
        
        // Then
        XCTAssertNotNil(navigationViews, "Navigation views should not be nil")

    }
    
}

