//
//  SignupView.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 28/04/2021.
//

import SwiftUI


struct SignupView: View {
    @Binding var firstName : String
    @Binding var email : String
    @Binding var password : String
    var body: some View {
        VStack {
            SignupTextField(firstName: $firstName, imageName: "person", title: "First Name ")
            SignupTextField(firstName: $email, imageName: "envelope", title: "Email")
            SignupTextField(firstName: $password, imageName: "lock", title: "Password")
                .padding(.top, 50.0)
            Text.init(firstName)
        }
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(firstName: .constant(""), email: .constant(""),password: .constant(""))
    }
}
