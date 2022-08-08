//
//  AsyncImage.swift
//  StockApp
//
//  Created by Devangi Prajapati on 05/08/22.
//

import Foundation
import SwiftUI

struct AsyncImage<PlaceHolderView : View>: View {

  @StateObject private var loader : ImageLoader

  private let placeHolder : PlaceHolderView
  private let image : (UIImage) -> Image

  init(url : URL , @ViewBuilder placeHolder : () -> PlaceHolderView , @ViewBuilder image : @escaping (UIImage) -> Image = Image.init(uiImage: )){
    self.placeHolder = placeHolder()
    self.image = image
    _loader = StateObject(wrappedValue: ImageLoader(url: url ))
  }

  private var content : some View {
    Group {
      if loader.image != nil {
        image(loader.image!)
      } else {
        placeHolder
      }
    }
  }

  var body: some View {
    content.onAppear(perform: loader.load)
  }

}
