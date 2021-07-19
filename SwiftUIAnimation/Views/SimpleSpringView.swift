//
//  SpringTextView.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/16/21.
//

import SwiftUI

struct SimpleSpringView: View {
  @State var show = false
  
  var body: some View {
    VStack {
      Text("Spring Animation")
        .scaleEffect(show ? 2 : 1)
        .animation(.interpolatingSpring(mass: 0.7, stiffness: 200, damping: 10, initialVelocity: 4))
        .onTapGesture {
          show.toggle()
        }
      
      Image(systemName: "heart.fill")
        .foregroundColor(.red)
        .imageScale(.large)
        .scaleEffect(show ? 4: 1)
        .animation(.interpolatingSpring(mass: 0.7, stiffness: 200, damping: 10, initialVelocity: 4))
        .onTapGesture {
          show.toggle()
        }
    }
  }
}

struct SpringTextView_Previews: PreviewProvider {
  static var previews: some View {
    SimpleSpringView()
  }
}
