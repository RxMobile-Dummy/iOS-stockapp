//
//  UserDefaultsManager.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation
final class UserDefaultManager {
  /// symbolKey object of String
  private static let symbolKey = kSYMBOL_KEY
 /// savedSymbols object of String Array
  var savedSymbols = [String]()
 /// shared object of UserDefaultManager
  static let shared = UserDefaultManager()

  //MARK: - Init Method
  private init() {
    get()
  }

  //MARK: - Get Saved symbol Data From UserDefaults
  func get() {
    if let saved =  kUSERDEFAULT.object(forKey: Self.symbolKey) as? [String] {
      savedSymbols = saved
    }
  }

  //MARK: - Set Saved symbol Data From UserDefaults
  /**
   - Parameter symbol: object of String
   */
  func set(symbol : String) {
    savedSymbols.append(symbol)
    kUSERDEFAULT.setValue(self.savedSymbols, forKey: Self.symbolKey)
  }
}
