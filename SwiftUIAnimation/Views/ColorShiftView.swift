//
//  ColorShiftView.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/16/21.
//

import SwiftUI

struct ColorShiftView: View {
  @State private var shift = false
  let animation: Animation = .easeInOut(duration: 5).repeatForever(autoreverses: true)
  
    var body: some View {
        Image(uiImage: #imageLiteral(resourceName: "spaceMan"))
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()
          .hueRotation(.degrees(shift ? 45 : 1600))
          // Interesting SwiftUI Behavior -- BELOW
          //.animation(animation, value: shift)
          .animation(.easeInOut(duration: 5).repeatForever(autoreverses: true))
          .onAppear {
            shift.toggle()
          }
    }
}

struct ColorShiftView_Previews: PreviewProvider {
    static var previews: some View {
        ColorShiftView()
    }
}

/*
 When this view is called created inside a navgation view via a navigaiton link,
 there is some shifting side to side behavior at the start/ end of the animation.
 This happens when you create the animation in line at the view modifier in the body.
 When you create the animation ahead of time as a constant this shifting goes away.
 */
