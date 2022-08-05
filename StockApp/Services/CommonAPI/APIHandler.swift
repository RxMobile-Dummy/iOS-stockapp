//
//  APIHandler.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation
struct APIHandler {

  //MARK: - Set Up BaseUrl
  static var baseURL : String {
    return kBASEURL
  }
  
  //MARK: - Set Up Search URL
  /**
   - Parameter searchKey: Object of String
   - Return String
   */
  static func symbolSearchUrl(for searchKey : String) -> String {
    return urlBy(symbol: .search, searchKey: searchKey)
  }

  //MARK: - Set Up Quote URL
  /**
   - Parameter searchKey: Object of String
   - Return String
   */
  static func quoteUrl(searchKey : String?) -> String {
    return urlBy(symbol: .quote, searchKey: searchKey)
  }

  //MARK: - Set Up Common URL Method
  /**
   - Parameter symbol: Object of SymbolFunction
   - Parameter searchKey: Object of String
   - Return String
   */
  private static func urlBy(symbol : SymbolFunction , searchKey : String? = "") -> String {
    switch symbol {
    case .search :
      return "\(baseURL)function=\(symbol.rawValue)&apikey=\(kAPIKEY)&keywords=\(searchKey!)"
    case .quote :
      return "\(baseURL)function=\(symbol.rawValue)&symbol=IBM&apikey=\(kAPIKEY)"
    }
  }
}
