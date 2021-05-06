//
//  ButtonTuts.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI

struct AppButtonModifier1 :ViewModifier {
    
    var startColor : Color = .red
    
    func body(content: Self.Content) -> some View {
       
        content
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .foregroundColor(.white)
            .clipShape(Capsule())
        
    }
}

struct AppButtonStyle1 : ButtonStyle {
    
    var startColor : Color = .red
    func makeBody(configuration: Self.Configuration) -> some View {
        
        return configuration.label
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .foregroundColor(.white)
            .clipShape(Capsule())
        
    }
}




struct ButtonTuts: View {
    var body: some View {
      
        VStack {
            Button(action: {
                print("Some Action perform")
            }, label: {
                Text("Button1")
            })
            .modifier(AppButtonModifier1(startColor: .green))
            
            Button(action: {
                print("Some Action perform")
            }, label: {
                Text("Button2")
            })
            .modifier(AppButtonModifier1(startColor: .yellow))
           
            
            
        }
    }
}


struct ButtonTuts_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTuts()
    }
}
