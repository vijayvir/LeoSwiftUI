//
//  LayoutPrioritiesUIDemo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI

struct LayoutPrioritiesUIDemo: View {
    var body: some View {
           HStack(spacing: 16) {
               Text("Hello")
                .layoutPriority(1)
               Text("World")
                .layoutPriority(2)
               Text("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                .layoutPriority(3)
           }
           .font(.largeTitle)
       }
}

struct LayoutPrioritiesUIDemo_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPrioritiesUIDemo()
    }
}
