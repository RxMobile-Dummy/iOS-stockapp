//
//  HeaderView.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import SwiftUI

struct HeaderView: View {

  /// MARK: - Views Variables
  /// dateFormatter object DateFormatter
  private let dateFormatter : DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = kMMM_dd
    return formatter
  }()

  /// stocks bind of headerview object of String Array
  @Binding var stocks : [String]

  /// showSearch object of Bool
  @State private var showSearch = false

  //MARK: - Body View
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: -5) {
        Text("Stocks")
          .foregroundColor(.white)
          .bold()

        Text("\(Date(), formatter:  dateFormatter)")
          .foregroundColor(.gray)
          .bold()

      }.font(.title)

      Spacer()

      Button{
        showSearch.toggle()
      } label: {
        Image(systemName: kPLUS)
          .font(.title)
          .foregroundColor(.white)
      }.sheet(isPresented: $showSearch) {

      } content: {
        Text("Search view will go here")
      }
    }.background(Color.black)
  }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
      HeaderView(stocks: .constant(["AAPL" , "GOOG"]))
    }
}
