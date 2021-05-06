//
//  MagnificationGestureDemo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI

struct MagnificationGestureDemo: View {
    
    @GestureState var magnifyBy = CGFloat(1.0)
    var magnification: some Gesture {
         MagnificationGesture()
             .updating($magnifyBy) { currentState, gestureState, transaction in
                print(currentState , gestureState)
                 gestureState = currentState
             }
     }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            Circle()
                .frame(width: 100 * magnifyBy,
                       height: 100 * magnifyBy,
                       alignment: .center)
                .gesture(magnification)
            Text("Hello, World!\(magnifyBy)")
        })
        
       
    }
}

struct MagnificationGestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureDemo()
    }
}
