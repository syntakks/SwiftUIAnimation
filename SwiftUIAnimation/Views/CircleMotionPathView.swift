//
//  CircleMotionPathView.swift
//  SwiftUIAnimation
//
//  Created by Steve Wall on 7/19/21.
//

import SwiftUI

struct CircleMotionPathView: View {
  @State var fly = false
  let animation: Animation = .linear(duration: 5).repeatForever(autoreverses: false)
  
  var body: some View {
    ZStack {
      Circle()
        .stroke()
        .frame(width: 300, height: 300)
        .foregroundColor(.orange)
      
      Image(systemName: "airplane")
        .font(.largeTitle)
        .foregroundColor(.blue)
        .offset(y: -150)
        .rotationEffect(.degrees(fly ? 0 : -360))
        .animation(animation, value: fly)
    }
    .onAppear {
      fly.toggle()
    }
    
    
      
  }
}

struct CircleMotionPathView_Previews: PreviewProvider {
  static var previews: some View {
    CircleMotionPathView()
  }
}
