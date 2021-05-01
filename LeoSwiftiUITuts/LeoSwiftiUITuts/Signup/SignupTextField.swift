//
//  signupTextField.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 29/04/2021.
//

import SwiftUI

struct SignupTextField: View {
    @Binding var firstName : String
    var imageName : String
    @State var isEditing : Bool = false
    var title : String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .animation(.linear(duration: 0.5))
                .foregroundColor(isEditing ?.green :.red)
                  
                Spacer().background(Color.purple)
          
                TextField(title, text: $firstName) { (value) in
                    isEditing = value
          
                } onCommit: {
                    isEditing = false
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
        SignupTextField(   firstName: .constant("Vijayvir"), imageName: "heart.fill", title: "First Namedr")
            .previewDisplayName("TextFild")
    }
}
