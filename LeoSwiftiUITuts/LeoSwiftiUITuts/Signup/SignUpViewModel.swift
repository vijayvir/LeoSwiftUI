//
//  SignUpViewModel.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 05/05/2021.
//

import Foundation
import Combine
class SignUpViewModel : ObservableObject {
    @Published var firstName : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    var subsribtions =  Set<AnyCancellable>()
    
    init() {
        $firstName.sink { (value ) in
            print(value)
        }.store(in: &subsribtions)
        
    }
    
}
