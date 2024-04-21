//
//  InfoResponse.swift
//  RickAndMorty_API
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import UIKit
import Combine

struct InfoResponse: Codable, Equatable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    init(count: Int, pages: Int, next: String? = nil, prev: String? = nil) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
    
}
