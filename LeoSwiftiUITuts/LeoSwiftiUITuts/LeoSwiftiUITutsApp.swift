//
//  LeoSwiftiUITutsApp.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 28/04/2021.
//

import SwiftUI

@main
struct LeoSwiftiUITutsApp: App {
    var body: some Scene {
        WindowGroup {
            SignupView(firstName: .constant(""), email: .constant(""),password: .constant(""))
        }
    }
}
