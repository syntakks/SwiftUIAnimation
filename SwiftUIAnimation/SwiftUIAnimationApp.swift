//
//  SwiftUIAnimationApp.swift
//  SwiftUIAnimation
//
//  Created by Stephen Wall on 7/16/21.
//

import SwiftUI

@main
struct SwiftUIAnimationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
              .environmentObject(ViewModel())
        }
    }
}
