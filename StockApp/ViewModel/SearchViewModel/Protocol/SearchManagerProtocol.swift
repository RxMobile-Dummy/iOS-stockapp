//
//  SearchManagerProtocol.swift
//  StockApp
//
//  Created by Devangi Prajapati on 08/08/22.
//

import Foundation

protocol  SearchManagerProtocol{
  /// searches object of [Quote] array
  var searches : [Search] {get set}
  /// get Search data method
  func getSearchData(strKeyWord : String , completion : @escaping (Result<[Search] , NetworkError>) -> Void)
}
