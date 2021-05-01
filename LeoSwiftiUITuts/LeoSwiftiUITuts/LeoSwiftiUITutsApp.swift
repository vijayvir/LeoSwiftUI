//
//  LeoSwiftiUITutsApp.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 28/04/2021.
//

import SwiftUI

@main
struct LeoSwiftiUITutsApp: App {
    //M-V-VM
    // V1 {SV} -> v- V -V (EV)
    
    var body: some Scene {
        WindowGroup {
            SignupView(firstName: "", email: "", password: "")
        }
    }
}
