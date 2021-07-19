//
//  ShapeMorphingView.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/16/21.
//

import SwiftUI

struct ShapeMorphingView: View {
  @State var morph = false
  
    var body: some View {
        Rectangle()
          .frame(width: 300, height: 300)
          .foregroundColor(morph ? .blue : .green)
          .cornerRadius(morph ? 150 : 0)
          .animation(.easeInOut)
          .onTapGesture {
            morph.toggle()
          }
    }
}

struct ShapeMorphingView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeMorphingView()
    }
}
