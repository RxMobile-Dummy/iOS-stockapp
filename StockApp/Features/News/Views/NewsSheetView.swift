//
//  NewsSheetView.swift
//  StockApp
//
//  Created by Devangi Prajapati on 05/08/22.
//

import SwiftUI

struct NewsSheetView: View {
  
  @Binding var newsOpen : Bool
  @ObservedObject var newsManager : NewsDownloadManager
  
  init(newsOpen : Binding<Bool> , newsManager : NewsDownloadManager) {
    UITableView.appearance().separatorStyle = .none
    UITableView.appearance().backgroundColor = .clear
    UITableView.appearance().backgroundColor = .clear
    self._newsOpen = newsOpen
    self.newsManager = newsManager
  }
  
  var body: some View {
    BottomSheetView(isOpen: $newsOpen, maxHeight: Device_MainHeight * 0.89) {
      ZStack {
        Color.white
        Rectangle().fill(Color.black.opacity(0.8))
        
        VStack(alignment: .leading) {
          NewsHeaderView()
          Spacer()
          NewsListView(newsManager: newsManager)
        }.padding()
      }
    }.edgesIgnoringSafeArea(.vertical)
  }
}


