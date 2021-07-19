//
//  RotateInfinityView.swift
//  SwiftUIAnimation
//
//  Created by Steve Wall on 7/19/21.
//

import SwiftUI

struct RotateInfinityView: View {
  @State var trimPath = false
  @State var rotate = false
  let trimAnimation: Animation = .easeInOut(duration: 1.5).repeatForever(autoreverses: true)
  let rotateAnimation: Animation = .easeInOut(duration: 1.5).repeatForever(autoreverses: false)
  
  var body: some View {
    ZStack {
      Path { path in
        path.addLines([
          .init(x: 2, y: 1),
          .init(x: 1, y: 0),
          .init(x: 0, y: 1),
          .init(x: 1, y: 2),
          .init(x: 3, y: 0),
          .init(x: 4, y: 1),
          .init(x: 3, y: 2),
          .init(x: 2, y: 1)
        ])
      }
      // Trim Path
      .trim(from: trimPath ? 1/2: 0, to: trimPath ? 1/2 : 1)
      .scale(50, anchor: .topLeading)
      .stroke(Color.blue, lineWidth: 6)
      .offset(x: 110, y: 350) // How to handle this for all screen sizes?
      .animation(trimAnimation, value: trimPath)
      .onAppear {
        trimPath.toggle()
      }
    }
    // Rotate Path
    .rotationEffect(.degrees(rotate ? 0 : -360))
    .scaleEffect(0.3, anchor: .center)
    .animation(rotateAnimation, value: rotate)
    .onAppear {
      rotate.toggle()
    }
    
  }
  
}

struct RotateInfinityView_Previews: PreviewProvider {
  static var previews: some View {
    RotateInfinityView()
  }
}
