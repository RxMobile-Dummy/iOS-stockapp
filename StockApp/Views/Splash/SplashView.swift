//
//  SplashView.swift
//  StockApp
//
//  Created by Devangi Prajapati on 09/08/22.
//

import SwiftUI

struct SplashView: View {

  /// isActiveBool state object of Bool
  @State var isActiveBool = false

  //MARK: - Body View
  var body: some View {
    ZStack (alignment: .center){
      Color.black
      VStack {
        if self.isActiveBool {
          ContentView()
        } else {
          Image(kIMG_SPLASH).frame(width: 100, height: 100)
            .scaledToFit()
            .padding(.bottom , 10)
          Text(kWELCOME_TO)
            .bold()
            .font(.title)
            .foregroundColor(Color.white)
            .padding(.bottom , 10)
          Text(kSTOCKS)
            .bold()
            .font(.title)
            .foregroundColor(Color.blue)
        }
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
          withAnimation {
            self.isActiveBool = true
          }
        }
      }
    }.edgesIgnoringSafeArea(.all)
  }
}

//MARK: - SplashView Previews
struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    SplashView()
  }
}
