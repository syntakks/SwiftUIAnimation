//
//  CircleProgressView.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/16/21.
//

import SwiftUI

struct CircleProgressView: View {
  @State var grow = false
  let animation: Animation = .linear(duration: 2.5).repeatForever(autoreverses: false).delay(1.0)
  
  var body: some View {
    ZStack {
      Circle()
        .trim(from: 0, to: 1)
        .stroke(Color.blue, lineWidth: 20)
        .frame(width: 300, height: 300)
        .opacity(0.2)
      Circle()
        .trim(from: grow ? 0 : 1, to: 1)
        .stroke(Color.blue, lineWidth: 20)
        .frame(width: 300, height: 300)
        .rotationEffect(.degrees(90), anchor: .center)
        .animation(animation, value: grow)
        .onAppear {
          grow.toggle()
        }
    }
  }
}

struct CircleProgressView_Previews: PreviewProvider {
  static var previews: some View {
    CircleProgressView()
  }
}
