//
//  CommonDragView.swift
//  UnderstandingGestures
//
//  Created by vijayvir on 09/05/2021.
//

import SwiftUI

struct CommonDragView: View {
    var body: some View {
       
        DraggableView(dragState: .inactive, foreground: .gray) {
            
            Text("Vijayvir")
                .fontWeight(.bold)
                .font(.system(size: 100))
        }
        
    }
}

struct CommonDragView_Previews: PreviewProvider {
    static var previews: some View {
        CommonDragView()
    }
}
