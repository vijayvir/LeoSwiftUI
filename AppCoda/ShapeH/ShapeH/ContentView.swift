//
//  ContentView.swift
//  ShapeH
//
//  Created by vijayvir on 10/05/2021.
//

import SwiftUI

struct ContentView: View {
 
    @State var moveOn : Bool = false
    
    var body: some View {
     
 
        ZStack{

            Circle()
                .stroke(lineWidth: 1)
                .frame(width: 100, height: 100, alignment: .center)
            
            Circle()
                .frame(width: 154, height: 15, alignment: .center)
                .foregroundColor(.blue)
                .offset(x: 0, y: -50)
                .rotationEffect(.degrees(moveOn ? 0 : 360), anchor: .center)
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
        }
        .rotation3DEffect(
            .degrees(60),
            axis: (x: moveOn ? 20    : 40, y: 0.5, z: 0.0))
        .animation(Animation.easeIn(duration: 0.5   ).repeatForever(autoreverses: true))
        .onAppear(perform: {
            moveOn.toggle()
        })
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
