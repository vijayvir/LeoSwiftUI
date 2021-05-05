//
//  signupTextField.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 29/04/2021.
//

import SwiftUI

struct SignupTextField: View {
    @Binding var outputValue : String
    var imageName : String
    @State var isEditing : Bool = false
    var title : String
    var isSecure : Bool = false
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .animation(.linear(duration: 0.5))
                .foregroundColor(isEditing ?.green :.red)
                  
                Spacer().background(Color.purple)
          
                if isSecure {
                    SecureField(title, text: $outputValue) {
                        isEditing = false
                    }
                }else {
                    TextField(title, text: $outputValue) { (value) in
                        isEditing = value
              
                    } onCommit: {
                        isEditing = false
                    }
                }
            

                    
            }
      
                
        }
        .foregroundColor(isEditing ?.green :.red)
        .padding()
        .background(Color.gray)
        .cornerRadius(25)
        
    }
}

struct signupTextField_Previews: PreviewProvider {
   @State var firstName  : String
    
    static var previews: some View {
        SignupTextField(   outputValue: .constant("Vijayvir"), imageName: "heart.fill", title: "First Namedr")
            .previewDisplayName("TextFild")
    }
}
