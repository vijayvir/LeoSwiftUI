//
//  ButtonLeo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI

struct ButtonLeo: View {
    
   
    @State var butttonStatus : Bool = true
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button(action: {
                butttonStatus.toggle()
            }, label: {
                Text("Button Press me")
            }).modifier(AppButtonModifier(isPressed: butttonStatus))
            
            Button("SimpleButton") {
                print("Press me ")
            }
            .buttonStyle(AppButton()) // From here you can know the which class is needed
        }
        
    }
}

struct ButtonLeo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLeo()
    }
}

