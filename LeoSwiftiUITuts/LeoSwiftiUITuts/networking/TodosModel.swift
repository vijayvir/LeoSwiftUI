//
//  UserModel.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 05/05/2021.
//

import Foundation

struct TodosModel : Codable {
    
    var todos: [Todo]
    struct Todo : Codable,Identifiable {
        let userId : Int
        let id : Int
        let title : String
        let completed : Bool
   
    }
}
