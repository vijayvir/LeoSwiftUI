//
//  LeoSwiftUIControlsApp.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 29/04/2021.
//

import SwiftUI

@main
struct LeoSwiftUIControlsApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ButtonTuts()
        }   .onChange(of: scenePhase) { newScenePhase in
            if newScenePhase == .background {
        
            }
        }
        
    }
}
