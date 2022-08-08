//
//  ContentView.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import SwiftUI

struct ContentView: View {

  //MARK: - Views  Variables
  /// stockManager observedObject of StockQuoteManager
  @ObservedObject var stockManager = StockQuoteManager()

  /// stocks static private object of StringArray
  @State private  var stocks = UserDefaultManager.shared.savedSymbols
  /// searchTerm static private object of String
  @State private var searchTerm = ""
  /// newsOpen static private object of Bool
  @State private var newsOpen = false
  /// oldStocks static private object of StringArray
  @State private var oldStocks = [String]()
  /// isLoading static private object of Bool
  @State private var isLoading = false

  //MARK: - Init SetUp Method
  /**
   Call this method for UITableView Style
   */
  init() {
    UITableView.appearance().separatorStyle = .none
    UITableView.appearance().backgroundColor = .clear
    UITableViewCell.appearance().backgroundColor = .clear
  }

  //MARK: - Body View
  var body: some View {
    ZStack{
      Color.black
      VStack(alignment: .leading) {
        if newsOpen {
          withAnimation {
            /// Quote View Set into Min Size Style
            MiniQuoteView(stockQuotes: stockManager)
              .foregroundColor(.white)
              .padding(.top , 50)
              .frame(height: newsOpen ? 100 : 0)
              .transition(.move(edge: .top))
          }
        } else {
          withAnimation {
            /// Quote View Set into Header View Style
            HeaderView(stocks: $stocks)
              .padding(.top , 50)
              .frame(height: newsOpen ? 0 : 100)
              .transition(.move(edge: .top))
          }
        }
        List {
          Group {
            /// Search TextView Method
            SearchTextView(searchTerm: $searchTerm)
            /// List of Quotes Method
            ForEach(getQuotes()){ quote in
              QuoteCell(quote: quote)
            }.listRowBackground(Color.clear)
              .listRowInsets(EdgeInsets())
          }
        }.onAppear {
          /// Fetch Quotes Data
          fetchData(for: stocks)
          oldStocks = stocks
        }.onChange(of: stocks) { newValue in

        }.listStyle(PlainListStyle())
          .foregroundColor(.white)
      }.padding(.horizontal , 16)
        .padding(.bottom , Device_MainHeight * 0.21)

      /// ProgresBar View
      if (isLoading == true) {
        LoadingView()
      }
    }.edgesIgnoringSafeArea(.all)
  }

  //MARK: - Get Quotes From Search Screen
  private func getQuotes() -> [Quote] {
    return searchTerm.isEmpty ? stockManager.quotes : stockManager.quotes.filter({ quote in
      quote.symbol.lowercased().contains(searchTerm.lowercased())
    })
  }

  //MARK: - Fetch Data From Get Quotes API Call
  private func fetchData(for symbols : [String]) {
    isLoading = true
    stockManager.getQuotesData(stocks: symbols) { _ in
      isLoading = false
    }
  }
}

//MARK: - ContentView_Previews Previews
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
