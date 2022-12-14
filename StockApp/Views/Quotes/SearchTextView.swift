//
//  SearchTextView.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import SwiftUI

struct SearchTextView: View {
  
  /// MARK: - Views Variables
  /// stocks bind of SearchTextView object of String
  @Binding var searchTerm : String

  /// editingChanged method of type Bool
  var editingChanged : (Bool) -> Void = { _ in}
  /// onCommit method of text
  var commit : () -> Void = {}
  
  //MARK: - Body View
  var body: some View {
    /// Custom Textfield Method
    CustomTextField(placeHolder: Text(kSEARCH).foregroundColor(Color.gray), text: $searchTerm , editingChanged: editingChanged , commit: commit)
      .foregroundColor(.white)
      .padding(.leading,40)
      .frame(height:50)
      .background(ZStack(alignment: .leading) {
        RoundedRectangle(cornerRadius: 5)
          .fill(Color.gray.opacity(0.6))
        Image(systemName: kMAGNIFYING_GLASS)
          .foregroundColor(Color.gray)
          .padding(.leading , 10)
      })
  }
}

//MARK: - Search TextView Previews
struct SearchTextView_Previews: PreviewProvider {
  static var previews: some View {
    SearchTextView(searchTerm: .constant(""))
  }
}
