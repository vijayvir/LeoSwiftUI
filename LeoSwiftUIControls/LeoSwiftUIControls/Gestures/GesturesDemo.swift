//
//  GesturesDemo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI

struct GesturesDemo: View {
    
    @State var currentValueOfGesture : String = ""
    @State var currentValueOfLongGesture : String = ""
    @GestureState var isDetectingLongPress = false
    @GestureState var isDetectingTapPress = 1
    @State var totalNumberOfTaps = 0
    var tapGesture = TapGesture()
        .onEnded { _ in
    print("onGesture is Tapped")
          
       }
    
    var body: some View {
  
       
        
        VStack {
            Circle()
              
                .frame(width: 100, height: 100, alignment: .center)
                
                .gesture(
                    tapGesture
                        .updating($isDetectingTapPress, body: { (currentValue, state, transations ) in
                            print("🤓 ",currentValue)
                            print("🤓state 🤓",state)
                            print("🤓 transaction🤓🤓",transations)
                        })
                        .onEnded({ _ in
                        print("Gesture is tapped")
                    currentValueOfGesture = "Gesture is tapped and end method is called "
                    })
                    
                )
            
            Text(currentValueOfGesture)
            
            Circle()
                .fill(isDetectingLongPress ? Color.yellow : Color.green)
                .frame(width: 100, height: 100, alignment: .center)
                .animation(.easeIn)
                .gesture(
                    LongPressGesture(minimumDuration: 5, maximumDistance: 100)
                        .updating($isDetectingLongPress, body: { (value,  state,  transaction) in
                            
                           state = value
                            print("🤓 ",value)
                            print("🤓state 🤓",state)
                            print("🤓 transaction🤓🤓",transaction)
                        })
                        .onChanged({ (gestureValue) in
                            print("Long press gesture Value  🦋",gestureValue)
                            self.totalNumberOfTaps += 1
                        })
                        .onEnded({ _ in
                        print("Loong Gesture is tapped")
                            currentValueOfLongGesture = "Gesture is tapped and end method is called "
                    })
                    
                )
            
            Text(currentValueOfLongGesture)
            Text("\(totalNumberOfTaps)")
                          .font(.largeTitle)
        }
        
   
    }
}

struct GesturesDemo_Previews: PreviewProvider {
    static var previews: some View {
        GesturesDemo()
    }
}
