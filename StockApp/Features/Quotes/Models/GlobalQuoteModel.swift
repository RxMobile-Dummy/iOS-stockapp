//
//  GlobalQuote.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation
import SwiftUI

struct GlobalQuoteResponse : Codable {
  var quote : Quote

  private enum CodingKeys : String , CodingKey {
    case quote = "Global Quote"
  }
}


