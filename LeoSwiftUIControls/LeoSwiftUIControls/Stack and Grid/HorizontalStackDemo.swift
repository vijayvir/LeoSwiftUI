//
//  HorizontalStackDemo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI

struct HorizontalStackDemo: View {
    
    
    var rows: [GridItem] =
            Array(repeating: .init(.fixed(200)), count: 2)

    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
        // Provider that scrollview and grid should be same
        // ScrollView(.horizontal) ---with--- LazyHGrid
                LazyHGrid(rows: rows, alignment: .top) {
                    ForEach((0...100), id: \.self) {
                        Text("\($0)")
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(Color.pink)
                    }
                }
            }
        }
    }
}

struct HorizontalStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalStackDemo()
    }
}
