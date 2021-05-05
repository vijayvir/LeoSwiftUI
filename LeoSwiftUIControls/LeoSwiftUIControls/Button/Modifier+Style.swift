//
//  Modifier+Style.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI
struct AppButtonModifier: ViewModifier {
       

    var isPressed : Bool
    func body(content: Content) -> some   View {
             content
                .padding()
                .background(isPressed ? LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing)  )
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2))
       }
    }

struct AppButton : ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some  View  {
        return   configuration.label
            .padding()
            .background(configuration.isPressed ? LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing)  )
            .animation(.easeOut(duration: 0.2))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2))
        
    }
    
}
