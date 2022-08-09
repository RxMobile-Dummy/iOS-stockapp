//
//  SearchManager.swift
//  StockApp
//
//  Created by Devangi Prajapati on 08/08/22.
//

import Foundation
import SwiftUI

final class SearchManager : SearchManagerProtocol , ObservableObject {
  
  ///  searches object of array of Search
  @Published var searches: [Search] = []

  /// setUp Method of Get Search Data
  /**
   - Parameter strKeyWord : object of String
   - Parameter completion : object of Result<[Search] , NetworkError>
  */
  func getSearchData(strKeyWord: String, completion: @escaping (Result<[Search], NetworkError>) -> Void) {
    NetworkManager<SearchResponse>().fetchData(from: URL(string: APIHandler.symbolSearchUrl(for: strKeyWord))!) { result in
      switch result {
      case .failure(let err):
        print(err)
        DispatchQueue.main.async {
          self.searches = []
        }
      case .success(let response) :
        DispatchQueue.main.async {
          self.searches = response.bestMatches
        }
      }
    }
  }
}
