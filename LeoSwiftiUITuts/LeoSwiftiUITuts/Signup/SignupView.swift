//
//  SignupView.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 28/04/2021.
//

import SwiftUI


struct SignupView: View {
    @State var firstName : String {
        didSet {
            print("FirstName")
        }
    }
    @State var email : String
    @State var password : String
    
    @StateObject var signupViewModel = SignUpViewModel()
    
    
    var body: some View {
    
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.blue)
                .opacity(5)
            
            VStack {
                SignupTextField(outputValue: $signupViewModel.firstName, imageName: "person", title: "First Name ")
                SignupTextField(outputValue: $signupViewModel.email, imageName: "envelope", title: "Email")
                SignupTextField(outputValue: $signupViewModel.password, imageName: "lock", title: "Password", isSecure :true )
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
