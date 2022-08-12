//
//  SearchView.swift
//  StockApp
//
//  Created by Devangi Prajapati on 08/08/22.
//

import SwiftUI

struct SearchView: View {

  /// presentationMode object of Environment  for dismiss view
  @Environment(\.presentationMode) var presentationMode
  /// state searchTeam object of String
  @State private var searchTeam : String = ""
  /// state selectedStock object of String
  @State private var selectedStock : String = ""
  /// state isSuccess object of Bool
  @State private var isSuccess : Bool = false
  /// observedObject searchManager object of SearchManager
  @ObservedObject var searchManager = SearchManager()

  //MARK: - Body View
  var body: some View {
    ZStack {
      Color.black.opacity(0.8)
      VStack {
        HStack {
          Button(action: {
            UserDefaultManager.shared.set(symbol: selectedStock)
            presentationMode.wrappedValue.dismiss()
          }) {
            Image(systemName: kARROW_LEFT)
              .foregroundColor(.white)
          }
          SearchTextView(searchTerm: $searchTeam)
          Button(action: {
            searchManager.getSearchData(strKeyWord: searchTeam) { result in
            }
          }) {
            Text(kDONE)
              .bold()
              .font(.subheadline)
              .foregroundColor(.white)
          }
        }
        Spacer()
        ScrollView {
          ForEach(searchManager.searches) { item in
            HStack {
              VStack(alignment: .leading) {
                Text(item.symbol)
                  .font(.title)
                  .bold()
                Text(item.type)
                  .font(.body)
              }
              Spacer()
              Text(item.name)
              Spacer()
              Button(action: {
                selectedStock =  item.symbol
              }) {
                Image(systemName: selectedStock ==  item.symbol ? kCHECKMARK_CIRCLE : kPLUS_CIRCLE_FILL)
              }
            }.foregroundColor(.white)
            RoundedRectangle(cornerRadius: 10)
              .fill(Color.white)
              .frame(height: 1)
          }
        }
      }.padding(.top , 12)
        .padding(.horizontal , 16)

      if(searchManager.searches.isEmpty) {
        Text(kNO_DATA_AVAILABLE)
          .bold()
          .font(.subheadline)
          .foregroundColor(.white)
      }
    }.edgesIgnoringSafeArea(.all)
  }
}

//MARK: - SearchView_Previews
struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
