//
//  ContentView.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 28/04/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(firstName: .constant("Value"), email: .constant("v"),password: .constant("f"))
    }
}
