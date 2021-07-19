//
//  CheckmarkCircleView.swift
//  SwiftUIAnimation
//
//  Created by Steve Wall on 7/19/21.
//

import SwiftUI

struct CheckmarkCircleView: View {
  @State var rotateBlueCircle = false
  @State var scaleUpGreenCircle = false
  @State var drawCheckMark = false
  
  let blueCircleAnimation: Animation = .easeIn(duration: 4)
  let greenCircleAnimation: Animation = .easeOut(duration: 4)
  let checkmarkAnimation: Animation = .easeOut(duration: 0.4).delay(4.0)
  
  var body: some View {
    ZStack {
      // Blue Circle
      Circle()
        .trim(from: 1/20, to : 1)
        .stroke(Color.blue, lineWidth: 4)
        .frame(width: 124, height: 124)
        .rotationEffect(.degrees(rotateBlueCircle ? 0 : -1440), anchor: .center)
        .animation(blueCircleAnimation, value: rotateBlueCircle)
        .onAppear {
          rotateBlueCircle.toggle()
        }
      
      // Green Circle
      Circle()
        .frame(width: 128, height: 128)
        .foregroundColor(.green)
        .scaleEffect(scaleUpGreenCircle ? 1 : 0, anchor: .center)
        .animation(greenCircleAnimation, value: scaleUpGreenCircle)
        .onAppear {
          scaleUpGreenCircle.toggle()
        }
      
      // Checkmark
      Checkmark()
        .trim(from: 0, to: drawCheckMark ? 1 : 0)
        .stroke(Color.white, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        .animation(checkmarkAnimation, value: drawCheckMark)
        .frame(width: 60, height: 40)
        .onAppear {
          drawCheckMark.toggle()
        }
    }
    
  }
  
}

// width: 60, height: 40
// size ratio: 3/2
struct Checkmark: Shape {
  func path(in rect: CGRect) -> Path {
    let start = CGPoint(x: rect.minX, y: rect.midY)
    let vertex = CGPoint(x: rect.maxX * 1/3, y: rect.maxY)
    let end = CGPoint(x: rect.maxX, y: rect.minY)
    var path = Path()
    path.move(to: start)
    path.addLine(to: vertex)
    path.addLine(to: end)
    return path
  }
}

struct CheckmarkCircleView_Previews: PreviewProvider {
  static var previews: some View {
    CheckmarkCircleView()
  }
}
