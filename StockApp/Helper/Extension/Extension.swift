//
//  Extension.swift
//  StockApp
//
//  Created by Devangi Prajapati on 08/08/22.
//

import Foundation
extension Array where Element : Hashable {
  func difference(from other : [Element]) -> [Element] {
    let thisSet = Set(self)
    let otherSet = Set(other)
    return Array(thisSet.symmetricDifference(otherSet))
  }
}
