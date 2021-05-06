//
//  AnimationImage.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI

struct AnimationImage: View {
    
   @State var showDetail : Bool = false
    var body: some View {
        
        
        VStack {
            Button(action: {
                withAnimation(.spring()) {
                                self.showDetail.toggle()
                            }
            }, label: {
                
                VStack {
                    HStack(alignment: .center
                           , spacing: 5, content: {
                        Spacer()
                        Text("spring")
                        Image(systemName: "chevron.right.circle")
                            .font(.system(size: 50))
                            .rotationEffect(showDetail ? .degrees(90) : .zero)
                            .animation(.spring())
                          
                       })
                    
                    HStack(alignment: .center
                           , spacing: 5, content: {
                        Spacer()
                        Text("easeInOut")
                        Image(systemName: "chevron.right.circle")
                            .font(.system(size: 50))
                            .rotationEffect(showDetail ? .degrees(90) : .zero)
                            .animation(.easeInOut(duration: 1))
                          
                       })
                    
                    HStack(alignment: .center
                           , spacing: 5, content: {
                        Spacer()
                        Text("interpolatingSpring")
                        Image(systemName: "chevron.right.circle")
                            .font(.system(size: 50))
                            .rotationEffect(showDetail ? .degrees(90) : .zero)
                            .animation(.interactiveSpring(response: 2, dampingFraction: 2, blendDuration: 1))
                          
                       })
                    
                    HStack(alignment: .center
                           , spacing: 5, content: {
                        Spacer()
                            Text("linear")
                                .scaleEffect(showDetail ? 1.5 : 1)
                                .animation(.linear)
                        Image(systemName: "chevron.right.circle")
                            .font(.system(size: 50))
                            .scaleEffect(showDetail ? 1.5 : 1)
                            .rotationEffect(showDetail ? .degrees(90) : .zero)
                            .animation(.linear)
                          
                       })
                    
                    HStack(alignment: .center
                           , spacing: 5, content: {
                        Spacer()
                            Text("linear")
                                .scaleEffect(showDetail ? 1.5 : 1)
                                .animation(.linear)
                        Image(systemName: "chevron.right.circle")
                            .font(.system(size: 50))
                            .scaleEffect(showDetail ? 1.5 : 1)
                            .rotationEffect(showDetail ? .degrees(90) : .zero)
                            .animation(.linear)
                          
                       })
                    
                    HStack(alignment: .center
                           , spacing: 5, content: {
                        Spacer()
                            Text("without anuimation linear")
                                .scaleEffect(showDetail ? 1.5 : 1)
                                .animation(.linear)
                        Image(systemName: "chevron.right.circle")
                            .font(.system(size: 50))
                            .scaleEffect(showDetail ? 1.5 : 1)
                            .rotationEffect(showDetail ? .degrees(90) : .zero)
                            
                          
                       })
                    

                }
              
        })
            
            if showDetail {
                Text("Show animation").transition(.moveAndFade)
            }
            
        }
        
    }
}
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .top).combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
struct AnimationImage_Previews: PreviewProvider {
    static var previews: some View {
        AnimationImage()
    }
}
