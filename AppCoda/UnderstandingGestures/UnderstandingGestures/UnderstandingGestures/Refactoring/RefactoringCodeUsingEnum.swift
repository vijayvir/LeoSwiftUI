//
//  RefactoringCodeUsingEnum.swift
//  UnderstandingGestures
//
//  Created by vijayvir on 09/05/2021.
//

import SwiftUI

struct RefactoringCodeUsingEnum: View {
    
    @GestureState var isPresses :Bool = false
    @GestureState private var dragOffset_TranslationSequence = CGSize.zero
    @GestureState private var dragOffset_Translation = CGSize.zero
    
    @GestureState var dragState : DragState = .inactive
    
    
    @State var foreground : Color = .green
    
    @State private var previous_position = CGSize.zero
    
    var body: some View {
        
        VStack {
            Text ("dragOffset_TranslationSequence\(dragOffset_TranslationSequence.debugDescription)")
            Text ("dragOffset_Translation\(dragOffset_Translation.debugDescription)")
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 200))
                .opacity(dragState.isPressing ? 0.5 : 1.0 ) // it will reset as the gesture completes
                .foregroundColor(dragState.isPressing ? .red : foreground)
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
                            case .second(false , let _):
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
}


struct RefactoringCodeUsingEnum_Previews: PreviewProvider {
    static var previews: some View {
        RefactoringCodeUsingEnum()
    }
}
