//
//  ImageCacheKey.swift
//  StockApp
//
//  Created by Devangi Prajapati on 05/08/22.
//

import Foundation
import SwiftUI

struct ImageCacheKey : EnvironmentKey {
  static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
  var imageCache :ImageCache {
    get { self[ImageCacheKey.self]}
    set { self[ImageCacheKey.self] = newValue}
  }
}
