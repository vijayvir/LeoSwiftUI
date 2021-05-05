//
//  ContentView.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 29/04/2021.
//

import SwiftUI

struct ListRowBackground: View {

    enum Flavor: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        case vanilla, chocolate, strawberry
    }

    var body: some View {
        List(Flavor.allCases, id: \.self) {
            Text($0.rawValue)
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 75, bottom: 0, trailing: 0))
        .listRowBackground(Image(systemName: "sparkles"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PickerViewDemo()
    }
}
