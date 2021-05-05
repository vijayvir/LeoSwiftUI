//
//  SignupView.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 28/04/2021.
//

import SwiftUI


struct SignupView: View {

    @StateObject var signupViewModel = SignUpViewModel()
    
    
    var body: some View {
    
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.blue)
                .opacity(5)
            
            VStack {
                Text("Sign up")
                Spacer()
                SignupTextField(outputValue: $signupViewModel.firstName, imageName: "person", title: "First Name ", promtText: signupViewModel.emailPrompt())
                SignupTextField(outputValue: $signupViewModel.email, imageName: "envelope", title: "Email", promtText: "Please write valid email id")
                SignupTextField(outputValue: $signupViewModel.password, imageName: "lock", title: "Password", promtText: "Please write password", isSecure :true )
                Spacer()
                    
                
                Button("Send") {
                    signupViewModel.send()
                }
                .padding()
                .foregroundColor(.yellow)
                .background(Color.purple)
                .opacity(signupViewModel.isDisable ? 0.5 : 1)
                .disabled(signupViewModel.isDisable)
                Spacer()
            }
            
           
               
            
        }
        
 
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
