//
//  StockQuoteManager.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation

final class StockQuoteManager : QuoteManagerProtocol , ObservableObject {

  ///  quotes object of array of Quote
  @Published var quotes: [Quote] = []

  /// setUp Method of Get Quotes Data
  /**
   - Parameter stocks : object of String
   - Parameter completion : object of Result<[Quote] , NetworkError>
  */
  func getQuotesData(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
    var internalQuotes : [Quote] = []
    let downloadQueue = DispatchQueue(label: "com.stockapp.StockApp")
    let downloadGroup = DispatchGroup()

    downloadGroup.enter()
    let url = URL(string: APIHandler.quoteUrl(searchKey: ""))
    /// FetchData of NetworkManager 
    NetworkManager<GlobalQuoteResponse>().fetchData(from: url!) { result in
      switch result {
      case .failure(_):
        downloadQueue.async {
          downloadGroup.leave()
        }
      case .success(let response):
        downloadQueue.async {
          internalQuotes.append(response.quote)
          downloadGroup.leave()
        }
      }
    }

    downloadGroup.notify(queue: DispatchQueue.global()) {
      completion(.success(internalQuotes))
      DispatchQueue.main.async {
        self.quotes.append(contentsOf: internalQuotes)
      }
    }
  }
}
