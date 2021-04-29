//
//  signupTextField.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 29/04/2021.
//

import SwiftUI

struct signupTextField: View {
    @Binding var firstName : String
    var imageName : String
    var title : String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                Spacer().background(Color.purple)
                TextField(title, text: $firstName)
            }
      
                
        }
        .foregroundColor(.red)
        .padding()
        .background(Color.gray)
        .cornerRadius(25)
    }
}

struct signupTextField_Previews: PreviewProvider {
   @State var firstName  : String
    
    static var previews: some View {
        signupTextField(   firstName: .constant("Vijayvir"), imageName: "heart.fill", title: "First Namedr")
    }
}
