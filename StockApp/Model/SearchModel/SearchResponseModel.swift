//
//  SearchResponse.swift
//  StockApp
//
//  Created by Devangi Prajapati on 08/08/22.
//

import Foundation

// MARK: - SearchResponse Structure
struct SearchResponse : Codable {
  var bestMatches : [Search]
}
