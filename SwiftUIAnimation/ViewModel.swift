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
    }
  }
  
}

class ViewModel: ObservableObject {
  @Published var currentPage: AnimationPage = .shapeMorphing
}
