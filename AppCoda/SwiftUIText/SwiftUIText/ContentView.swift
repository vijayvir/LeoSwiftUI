//
//  ContentView.swift
//  SwiftUIText
//
//  Created by Simon Ng on 13/8/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var sliderValue : Double = 0
    
    var body: some View {
        
        
        VStack{
            Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with  intuition.")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .padding()
               /// .rotationEffect(.degrees(0), anchor: UnitPoint(x: 0, y: 1))
                .rotation3DEffect(
                    .degrees(sliderValue),
                    axis: (x: 0, y: 1, z: 0),
                    anchor: .leading,
                    anchorZ: 1,
                    perspective: 1.0
                )
               // .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
                .shadow(color: .gray, radius: 2, x: 0, y: 15)
            
            Slider(value: $sliderValue, in: 0...360) {_ in
                
               
                print("SliderValue \($sliderValue)")
            }
            Text("SliderValue \(sliderValue)")
        }
        
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
