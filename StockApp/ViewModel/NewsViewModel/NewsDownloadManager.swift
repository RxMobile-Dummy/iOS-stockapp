//
//  NewsDownloadManager.swift
//  StockApp
//
//  Created by Devangi Prajapati on 05/08/22.
//

import Foundation

final class NewsDownloadManager : ObservableObject {

  
  @Published var newsArticles = [News]()
  
  private let newsUrlString = "country=us&category=business&apiKey=\(kNEWSKEY)"
  
  init() {
    download()
  }
  
  func download() {
    NetworkManager<NewsResponse>().fetchData(from: URL(string: kNEWSURL + newsUrlString)!) { result in
      switch result {
      case .failure(let error) :
        print(error)
      case .success(let response):
        DispatchQueue.main.async {
          let arrArticles = response.articles.filter { article in
            if(article.imageUrl != "") {
              return true
            }
            return false
          }
          self.newsArticles = arrArticles
        }
      }
    }
  }
}
