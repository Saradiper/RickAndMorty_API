//
//  URLProvider.swift
//  RickAndMorty_API
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


class URLProvider: URLProviderProtocol {
    func getBaseURL() -> String {
        return Constants.baseURL
    }
    
}
