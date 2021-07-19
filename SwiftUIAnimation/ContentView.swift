//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/16/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: ViewModel
  
    var body: some View {
      NavigationView {
        List(AnimationPage.allCases) { page in
          NavigationLink(destination: page.page()) {
            Text(page.rawValue)
          }
        }
        .navigationTitle("SwiftUI Animations")
      }
      
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          .environmentObject(ViewModel())
    }
}
