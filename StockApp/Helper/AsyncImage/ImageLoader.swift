//
//  ImageLoader.swift
//  StockApp
//
//  Created by Devangi Prajapati on 05/08/22.
//

import Combine
import UIKit

final class ImageLoader : ObservableObject {

  @Published var image : UIImage?

  private(set) var isLoading = false

  private let url : URL
  private var cache : ImageCache?
  private var cancellable : AnyCancellable?

  private static let imageProcessingQueue = DispatchQueue(label: "com.devtechie.imageProcessing")

  init(url : URL , cache : ImageCache? = nil) {
    self.url = url
    self.cache = cache
  }

  deinit {
    cancel()
  }

  func load() {
    guard !isLoading else {
      return
    }
    
    if let image = cache?[url] {
      self.image = image
      return
    }
    
    self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .map({ data in
        return UIImage(data: data.data)
      })
      .replaceError(with: nil)
      .handleEvents(
        receiveSubscription: { _ in
          self.onStart()
        },
        receiveOutput: { img in
          self.cache(img)
        },
        receiveCompletion: { _ in
          self.onFinish()
        },
        receiveCancel: {
          self.onFinish()
        })
      .subscribe(on: Self.imageProcessingQueue)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] in self?.image = $0 }
  }

  func onStart() {
    isLoading = true
  }

  func onFinish() {
    isLoading = false
  }

  private func cache(_ image : UIImage?) {
    image.map{ cache?[url] = $0}
  }

  func cancel() {
    cancellable?.cancel()
  }

}
