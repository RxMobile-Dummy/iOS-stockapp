//
//  Enum.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation
import SwiftUI

enum NetworkError : Error {
case error(err : String)
case invalidResponse(response : String)
case invalidData
case decodingError(err : String)
}

enum SymbolFunction : String{
  case search = "SYMBOL_SEARCH"
  case quote = "GLOBAL_QUOTE"
}

