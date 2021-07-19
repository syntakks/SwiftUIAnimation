//
//  SimpleLoadingSpinner.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/16/21.
//

import SwiftUI

struct SimpleLoadingSpinner: View {
  @State var spin = false
  let animation: Animation = .linear(duration: 0.8).repeatForever(autoreverses: false)
  
    var body: some View {
        Image(systemName: "arrow.2.circlepath.circle.fill")
          .resizable()
          .frame(width: 128, height: 128)
          .rotationEffect(.degrees(spin ? 360 : 0))
          .foregroundColor(.green)
          .animation(animation, value: spin)
          .onAppear {
            DispatchQueue.main.async {
              spin.toggle()
            }
          }
      
    }
}

struct SimpleLoadingSpinner_Previews: PreviewProvider {
    static var previews: some View {
        SimpleLoadingSpinner()
    }
}
