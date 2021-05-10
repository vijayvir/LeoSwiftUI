//
//  DraggableView.swift
//  UnderstandingGestures
//
//  Created by vijayvir on 09/05/2021.
//

import Foundation
import SwiftUI

struct DraggableView<Content> : View where Content : View {
    @GestureState var dragState : DragState = .inactive
    
    
    @State var foreground : Color = .green
    
    @State private var previous_position = CGSize.zero
    var content1 : () -> Content
    
    var body : some View {
        content1()
            .foregroundColor(dragState.isPressing ? .red : foreground)
            .opacity(dragState.isPressing ? 0.5 : 1.0 ) // it will reset as the gesture completes
          
            .offset(x: previous_position.width + dragState.translation.width,
                    y: previous_position.height + dragState.translation.height)
            .animation(.easeIn)
            .gesture(
                LongPressGesture(minimumDuration: 0.5, maximumDistance: 1)
                   
                    .onEnded({ (value) in
                        self.foreground = .green
                    })
                    
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: { (value, state, transation) in
                        
                        switch value {
                        
                        case .first(true ):
                            state = .pressing
                           
                        case .second(true, let value2):
                            
                            state = DragState.dragging(translation: value2?.translation ?? .zero)
                        case .second(false , _):
                            foreground = .yellow
                        default :
                            break
                        }
                        
                    })
                    .onEnded({ (value) in
                        switch value {
                        
                        case .first(_):
                            print("Tap")
                        case .second(true, let drag ):
                            if let some = drag {
                                self.foreground = .purple
                                self.previous_position.width =  self.previous_position.width + some.translation.width
                                self.previous_position.height =  self.previous_position.height + some.translation.height
                            }
                             
                        default :
                            break
                        }
                    })
                
                
            )
    }
    
    
}
