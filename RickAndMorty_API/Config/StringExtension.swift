//
//  StringExtension.swift
//  RickAndMorty_API
//
//  Created by Sara Diaz Perez on 21/4/24.
//

import Foundation


extension String {
    var localized: String {
          return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
      }
    
}
