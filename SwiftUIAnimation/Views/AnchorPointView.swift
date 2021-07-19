//
//  SwiftUIView.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/19/21.
//

import SwiftUI
enum AnchorPoint: String, CaseIterable {
  case top
  case trailing
  case bottom
  case leading
  
  func anchor() -> UnitPoint {
    switch self {
    case .top: return .top
    case .trailing: return .trailing
    case .bottom: return .bottom
    case .leading: return .leading
    }
  }
  
  func offest() -> CGFloat {
    switch self {
    case .top: return -25.0
    case .trailing: return 25.0
    case .bottom: return 25.0
    case .leading: return -25.0
    }
  }
}

struct AnchorPointView: View {
  @State var rotate = false
  @State var anchorPoint: AnchorPoint = .top
  let animation: Animation = .spring().repeatForever(autoreverses: true)
  
  var body: some View {
    ZStack {
      Group {
        Picker(selection: $anchorPoint, label: Text("Select an AnchorPoint")) {
          ForEach(AnchorPoint.allCases, id: \.self) {
            Text($0.rawValue)
          }
        }.pickerStyle(SegmentedPickerStyle())
      }.padding(.bottom, 500)
      
      Divider()
      Divider().offset(y: 25)
      Divider().offset(y: -25)
      Divider().rotationEffect(.degrees(90))
      Divider().rotationEffect(.degrees(90)).offset(x: 25)
      Divider().rotationEffect(.degrees(90)).offset(x: -25)
      
      Group {
        Rectangle()
          .frame(width: 50, height: 50)
          .foregroundColor(.blue)
          .rotationEffect(.degrees(rotate ? 0: 180), anchor: anchorPoint.anchor()) // Anchor Position
          .animation(animation, value: rotate)
          .onAppear {
            rotate.toggle()
          }
        
        // Hinge
        Circle()
          .frame(width: 10, height: 10)
          .foregroundColor(.orange)
          .offset(x: getXOffset(), y: getYOffset())
      }
    }
    
    
  }
  
  func getXOffset() -> CGFloat {
    switch self.anchorPoint {
    case .leading: return AnchorPoint.leading.offest()
    case .trailing: return AnchorPoint.trailing.offest()
    default: return 0.0
    }
  }
  
  func getYOffset() -> CGFloat {
    switch self.anchorPoint {
    case .top: return AnchorPoint.top.offest()
    case .bottom: return AnchorPoint.bottom.offest()
    default: return 0.0
    }
  }
}

struct AnchorPointView_Previews: PreviewProvider {
  static var previews: some View {
    AnchorPointView()
  }
}
