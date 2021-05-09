//
//  BasicGestures.swift
//  UnderstandingGestures
//
//  Created by vijayvir on 09/05/2021.
//

import SwiftUI

struct BasicGestures: View {
    
    @State var isPressed :Bool = false
    var body: some View {
      
        VStack {
            
            Image(systemName: "star.circle.fill")
                .foregroundColor(.green)
                .font(.system(size: 200))
                .scaleEffect(isPressed ? 0.5 : 1)
                .animation(.easeIn)
                .gesture(TapGesture()
                            
                       // here the Tap gesture will not have the value as it will only have on ended button.
                            .onEnded({
                                isPressed.toggle()
                                print("Some Thing is going to print")
                            }))
        }
    }
}

struct BasicGestures_Previews: PreviewProvider {
    static var previews: some View {
        BasicGestures()
    }
}
