//
//  APIError.swift
//  RickAndMorty_API
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        //User feedback
        switch self {
        case .unknown:
            return "error.message.badResponse".localized
        case .badURL, .parsing:
            return "error.message.generic".localized
        case .badResponse(_):
            return "error.message.statusCode".localized
        case .url(let error):
            return error?.localizedDescription ?? "error.message.generic".localized
        }
    }
    
    var description: String {
        //Info for debugging
        switch self {
        case .unknown:
            return "error.message.badResponse".localized
        case .badURL:
            return "error.message.badURL".localized
        case .url(let error):
            return error?.localizedDescription ?? "error.message.sesion".localized
        case .parsing(let error):
            return "error.message.parsing".localized + (error?.localizedDescription ?? "")
        case .badResponse(statusCode: let statusCode):
            return "error.message.statusCode".localized + "\(statusCode)"
        }
    }
    
}
