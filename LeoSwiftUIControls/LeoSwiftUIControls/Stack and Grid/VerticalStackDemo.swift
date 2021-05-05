//
//  VerticalStackDemo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI

struct VerticalStackDemo: View {
    var body: some View {
        
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            LazyVGrid(columns: [GridItem(.fixed(100))], content: {      ForEach((0...100), id: \.self) {
                Text("\($0)")
               .frame(width: 100, height: 200, alignment: .center)
                .background(Color.pink)
            }
            })
            
        })
    }
}

struct VerticalStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        VerticalStackDemo()
    }
}
