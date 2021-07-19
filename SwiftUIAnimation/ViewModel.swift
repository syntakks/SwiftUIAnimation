//
//  ViewModel.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/16/21.
//

import Foundation
import SwiftUI

enum AnimationPage: String, CaseIterable {
  case simpleSpring = "Simple Spring"
  case shapeMorphing = "Shape Morphing"
  case colorShift = "Color Shift Wallpaper"
  case simpleLoadingSpinner = "Simple Loading Spinner"
  case circleProgress = "Circle Progress Spinner"
  case anchorPointPosition = "Anchor Point Positioning"
  case circularMotionPath = "Circular Motion Path"
  case rotateInfinityPath = "Rotate Infinity Path"
  case checkmarkCircle = "Checkmark Circle Loading"
}
extension AnimationPage: Identifiable {
  var id: Self { self }
  
  @ViewBuilder
  func page() -> some View {
    switch self {
    case .simpleSpring:
      SimpleSpringView()
    case .shapeMorphing:
      ShapeMorphingView()
    case .colorShift:
      ColorShiftView()
    case .simpleLoadingSpinner:
      SimpleLoadingSpinner()
    case .circleProgress:
      CircleProgressView()
    case .anchorPointPosition:
      AnchorPointView()
    case .circularMotionPath:
      CircleMotionPathView()
    case .rotateInfinityPath:
      RotateInfinityView()
    case .checkmarkCircle:
      CheckmarkCircleView()
    }
  }
  
}

class ViewModel: ObservableObject {
  @Published var currentPage: AnimationPage = .shapeMorphing
}
