//
//  UsingDragGesture.swift
//  UnderstandingGestures
//
//  Created by vijayvir on 09/05/2021.
//

import SwiftUI

struct UsingDragGesture: View {
    @GestureState private var dragOffset_Translation = CGSize.zero
  
    @State private var previous_position = CGSize.zero
    
    var body: some View {
        
        VStack{
            
            Text ("\(dragOffset_Translation.debugDescription)")
            Text ("\(previous_position.debugDescription)")
            Image(systemName: "star.circle.fill")
                .font(.system(size: 200))
                .offset(x: previous_position.width +  dragOffset_Translation.width, y: previous_position.height +  dragOffset_Translation.height)
                .animation(.linear)
                .foregroundColor(.green)
                .gesture(
                    
                DragGesture(minimumDistance: 1, coordinateSpace: CoordinateSpace.local)
                    
                    .updating($dragOffset_Translation, body: { (currentValue, state, transaction) in
                        
                        state = currentValue.translation
                    })
                    
                    .onEnded({ (value) in
                        self.previous_position.width =  self.previous_position.width + value.translation.width
                        self.previous_position.height =  self.previous_position.height + value.translation.height
                        /*
                         Value(time: 2001-01-06 12:52:27 +0000,
                         location: (6.999994913736984, 382.999994913737),
                         startLocation: (89.66666666666667, 128.3333231608073),
                         velocity: SwiftUI._Velocity<__C.CGSize>(valuePerSecond: (-31.61572150134127, 31.09724578092171)))
                         */
                        
                        print(value )
                    })
                )
            
        }
        
      
        
    }
}

struct UsingDragGesture_Previews: PreviewProvider {
    static var previews: some View {
        UsingDragGesture()
    }
}
