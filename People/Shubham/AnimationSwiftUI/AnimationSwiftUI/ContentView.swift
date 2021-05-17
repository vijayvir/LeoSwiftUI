//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by vijayvir on 10/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var rotationDegree: Angle = Angle.degrees(-90)
    @State var trimEnd : CGFloat = 0
    let lg1 =  LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
    let lg2 =  LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .leading, endPoint: .trailing)
    
   @State private var state : Bool = false
    var body: some View {
 
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
        ZStack{
            Circle()
                .trim(from: 0 , to: trimEnd)
                .stroke(style: StrokeStyle(lineWidth: 18, lineCap: .round))
                .fill(state ? lg1 :lg2 )
                .frame(width: 120, height: 120, alignment: .center)
                .rotationEffect(rotationDegree)
            
        }.onAppear(perform: {
            
        print("On appear whatto do ")
         animation()
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true ) { timer in
                self.reset()
                self.animation()
            }
            
        })
    }
}
    func reset(){
        rotationDegree = Angle.degrees(-90)
       
        state = false
    }
     func animation(){
        withAnimation(.linear(duration: 1)) {
            state = false
            trimEnd = 1
            rotationDegree = Angle(degrees: 360)
        }
      
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            withAnimation(Animation.linear(duration: 1)) {
                state = true
                self.trimEnd =   0.01
                rotationDegree = Angle(degrees: 990)
            }
         
           
            /// smaller circle
       
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
