//
//  QuoteCell.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import SwiftUI

struct QuoteCell: View {

  /// MARK: - Views Variables
  /// quote object of Quote
  var quote :Quote?

  //MARK: - Body View
  var body: some View {
    HStack{
      Text(quote?.symbol ?? "")
        .font(.body)
        .bold()
      Spacer()
      Spacer()
      VStack{
        Text(quote?.price ?? "")
          .bold()
        Text(quote?.change ?? "")
          .padding(.horizontal)
          .frame(width: 130)
          .background(RoundedRectangle(cornerRadius: 5).fill(Double(quote?.change ?? "")! > 0.0 ? Color.green : Color.red) , alignment: .trailing)
      }
    }
  }
}

//MARK: - QuoteCell Previews
struct QuoteCell_Previews: PreviewProvider {
  static var previews: some View {
    /// set up QuoteCall
    QuoteCell()
  }
}
