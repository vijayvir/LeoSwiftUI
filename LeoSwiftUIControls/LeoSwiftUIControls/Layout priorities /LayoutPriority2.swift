//
//  LayoutPriority2.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI

struct LayoutPriority2: View {
    var body: some View {
            HStack {
                Text("The rain Spain falls mainly on the Spaniards.")
                Text("Knowledge is power, France is bacon.")
                    .layoutPriority(1)
            }
            .font(.largeTitle)
        }
}

struct LayoutPriority2_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriority2()
    }
}
