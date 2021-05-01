//
//  SignupView.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 28/04/2021.
//

import SwiftUI


struct SignupView: View {
    @State var firstName : String
    @State var email : String
    @State var password : String
    var body: some View {
    
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.blue)
            
            VStack {
                SignupTextField(firstName: $firstName, imageName: "person", title: "First Name ")
                SignupTextField(firstName: $email, imageName: "envelope", title: "Email")
                SignupTextField(firstName: $password, imageName: "lock", title: "Password")
                Text(firstName)
                    .background(Color.red)
                
            }  .background(Color.clear)
            
           
               
            
        }
        
 
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView( firstName: "", email: "",password: "")
    }
}
