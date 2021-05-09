//
//  LongPressGesture.swift
//  UnderstandingGestures
//
//  Created by vijayvir on 09/05/2021.
//

import SwiftUI

struct LongPressGesturee: View {
    
    @State var isPresses :Bool = false
    @GestureState var longPressTap = false
    @State var currentStateValue : String = ""
    var body: some View {
        
        
        Image(systemName: "star.circle.fill")
            .foregroundColor(.red)
            .font(.system(size: 200))
            .opacity(longPressTap ? 0.5 : 1.0 )
            .scaleEffect(isPresses ? 0.5 : 1)
            .animation(.easeIn)
            .gesture(
                
                LongPressGesture(minimumDuration: 0.5, maximumDistance: 1)
                        .onEnded({ value in
                          
                            isPresses.toggle()
                           print("onEnded:\(currentStateValue)")
                        })
                .updating($longPressTap, body: { (currentStateValueOfLongGesture, stateInOut, transaction) in
                    // The long gesture will only have the bool value, which  will tell's the system that button is clicked
                    print("Updating:\(currentStateValueOfLongGesture)")
                    stateInOut = currentStateValueOfLongGesture
                    
                })
            )
            .overlay(
                
                Text ("Some Place in imageview")
                
                , alignment: .center)
    }
        
    
}

struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesturee()
    }
}
