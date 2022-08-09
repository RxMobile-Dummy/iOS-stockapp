//
//  StockQuoteManager.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation

final class StockQuoteManager : StockQuoteManagerProtocol , ObservableObject {

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

    stocks.forEach { stock in
      downloadGroup.enter()
      let url = URL(string: APIHandler.quoteUrl(for: stock))
      print("URL...\(url!)")
      /// FetchData of NetworkManager
      NetworkManager<GlobalQuoteResponse>().fetchData(from: url!) { result in
        print("URL...\(url!)")
        switch result {
        case .failure(let error):
          print(error)
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
    }

    downloadGroup.notify(queue: DispatchQueue.global()) {
      completion(.success(internalQuotes))
      DispatchQueue.main.async {
        self.quotes.append(contentsOf: internalQuotes)
      }
    }
  }
}
