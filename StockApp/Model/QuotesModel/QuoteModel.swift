//
//  QuoteModel.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation

struct Quote : Codable {
  var symbol : String
  var open : String
  var high : String
  var low : String
  var price : String
  var change : String
  var changePercent : String

  enum CodingKeys : String , CodingKey {
    case symbol = "01. symbol"
    case open = "02. open"
    case high = "03. high"
    case low = "04. low"
    case price = "05. price"
    case change = "09. change"
    case changePercent =  "10. change percent"
  }

  init(symbol: String , open: String , high: String , low: String  , price: String , change: String , changePercent: String ) {

    self.symbol =  symbol
    self.open = open
    self.high = high
    self.low = low
    self.price = price
    self.change = change
    self.changePercent = changePercent
  }

}

extension Quote : Identifiable {
  var id : UUID {
    return UUID()
  }
}
