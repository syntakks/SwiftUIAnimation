//
//  SwiftUIView.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/19/21.
//

import SwiftUI
enum AnchorPoint: Int {
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
}

struct AnchorPointView: View {
  @State var rotate = false
  @State var anchorPoint: AnchorPoint = .top
  
  var body: some View {
    VStack {
      Picker(selection: $anchorPoint, label: Text("Select an AnchorPoint")) {
        Text("Top").tag(AnchorPoint.top.rawValue)
        Text("Trailing").tag(AnchorPoint.trailing.rawValue)
        Text("Bottom").tag(AnchorPoint.bottom.rawValue)
        Text("Leading").tag(AnchorPoint.leading.rawValue)
      }
      
      ZStack {
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
            .rotationEffect(.degrees(rotate ? 0: 180), anchor: .top) // Anchor Position
            .animation(.spring().repeatForever(autoreverses: true))
            .onAppear {
              rotate.toggle()
            }
          
          // Hinge
          Circle()
            .frame(width: 10, height: 10)
            .foregroundColor(.orange)
            .offset(x: 0, y: -25)
          
        }
        
      }
    }
    
    
  }
}

struct AnchorPointView_Previews: PreviewProvider {
  static var previews: some View {
    AnchorPointView()
  }
}
