//
//  QuoteManagerProtocol.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation
protocol  StockQuoteManagerProtocol{
  /// quotes object of [Quote] array
  var quotes : [Quote] {get set}
  /// getQuotesData method
  func getQuotesData(stocks : [String] , completion : @escaping (Result<[Quote] , NetworkError>) -> Void)
}
