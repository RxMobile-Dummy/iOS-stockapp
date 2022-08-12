//
//  GlobalQuote.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation
import SwiftUI

// MARK: - GlobalQuoteResponse DataClass
class GlobalQuoteResponse : Codable
{
  let quote: Quote

  enum CodingKeys: String, CodingKey {
    case quote = "Global Quote"
  }

  init(quote: Quote) {
    self.quote = quote
  }
}




