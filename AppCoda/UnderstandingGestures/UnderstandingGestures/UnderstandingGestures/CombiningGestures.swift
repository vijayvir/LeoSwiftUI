//
//  CombiningGestures.swift
//  UnderstandingGestures
//
//  Created by vijayvir on 09/05/2021.
//

import SwiftUI

struct CombiningGestures: View {
    
    @GestureState var isPresses :Bool = false
    @GestureState private var dragOffset_TranslationSequence = CGSize.zero
    @GestureState private var dragOffset_Translation = CGSize.zero
    
    @State var foreground : Color = .green
    
    @State private var previous_position = CGSize.zero
    
    var body: some View {
        
        VStack {
            Text ("dragOffset_TranslationSequence\(dragOffset_TranslationSequence.debugDescription)")
            Text ("dragOffset_Translation\(dragOffset_Translation.debugDescription)")
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 200))
                .opacity(isPresses ? 0.5 : 1.0 ) // it will reset as the gesture completes
                .foregroundColor(isPresses ? .red : foreground)
                .offset(x: previous_position.width + dragOffset_Translation.width,
                        y: previous_position.height + dragOffset_Translation.height)
                .animation(.easeIn)
                .gesture(
                    LongPressGesture(minimumDuration: 0.5, maximumDistance: 1)
                        .updating($isPresses, body: { (currentState, state, transaction) in
                            state = currentState
                        })
                        .onEnded({ (value) in
                            self.foreground = .green
                        })
                        
                        .sequenced(before: DragGesture())
                        .updating($dragOffset_Translation, body: { (value, state, transation) in
                            
                            switch value {
                            
                            case .first(let value12):
                                print("FirstValue" , value12 )
                            case .second(true, let value2):
                                
                                state = value2?.translation ?? .zero
                                
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

struct CombiningGestures_Previews: PreviewProvider {
    static var previews: some View {
        CombiningGestures()
    }
}
