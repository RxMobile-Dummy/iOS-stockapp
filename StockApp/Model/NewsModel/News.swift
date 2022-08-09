//
//  News.swift
//  StockApp
//
//  Created by Devangi Prajapati on 05/08/22.
//

import Foundation

struct News : Identifiable , Codable {
  var id : UUID {return UUID()}
  var title : String
  var url : String
  var urlToImage : String?
  var imageUrl : String {
    return urlToImage?.replacingOccurrences(of: "http://", with: "https://") ??  ""
  }
}
