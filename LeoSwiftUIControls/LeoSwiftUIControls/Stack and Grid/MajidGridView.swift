//
//  MajidGridView.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI

struct MajidGridView: View {
    private var columns: [GridItem] = [
      
        GridItem(.fixed(100), spacing: 5),
        
        GridItem(GridItem.Size.adaptive(minimum: 50, maximum: 100), spacing: 5, alignment: Alignment.center),
        GridItem(.fixed(50), spacing: 9),
       
        // GridItem(.fixed(50), spacing: 100)
        
//        GridItem(.flexible(minimum: 100)),
//         GridItem(.flexible())
    ]

    
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .leading,
                spacing: 1,
                pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                Section(header: Text("Section 1").font(.title)) {
                    ForEach(0...10, id: \.self) { index in
                        Color.red
                    }
                }

                Section(header: Text("Section 2").font(.title)) {
                    ForEach(11...20, id: \.self) { index in
                        Color.green
                    }
                }
            }
        }
    }
}
struct MajidGridView_Previews: PreviewProvider {
    static var previews: some View {
        MajidGridView()
    }
}
