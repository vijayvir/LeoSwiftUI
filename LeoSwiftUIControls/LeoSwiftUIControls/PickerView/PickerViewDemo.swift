//
//  PickerViewDemo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI

struct PickerViewDemo: View {
    var frameworks = ["UIKit", "Core Data", "CloudKit", "SwiftUI"]
      @State private var selectedFrameworkIndex = 0

    
    var body: some View {
        VStack {
                Picker(selection: $selectedFrameworkIndex, label: Text("")) {
                    ForEach(0 ..< frameworks.count) {
                       Text(self.frameworks[$0])
                    }
                 }
                 Text("Your favorite framework: \(frameworks[selectedFrameworkIndex])")
              }.padding()
        NavigationView {
             Form {
                 Section {
                     Picker(selection: $selectedFrameworkIndex, label: Text("Favorite Framework")) {
                         ForEach(0 ..< frameworks.count) {
                             Text(self.frameworks[$0])
                         }
                     }
                 }
             }
             .navigationBarTitle("Favorites")
         }
        
    }
}

struct PickerViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        PickerViewDemo()
    }
}
