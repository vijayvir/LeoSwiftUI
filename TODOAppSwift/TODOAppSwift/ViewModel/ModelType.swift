//
//  ModelType.swift
//  TODOAppSwift
//
//  Created by vijayvir on 29/04/2021.
//

import SwiftUI

enum ModelType : Identifiable ,View {
    case new
    case update(ToDo)
    var id : String {
        
        switch self {
        
        case .new:
            return "new"
        case .update(_):
            return "update"
        }
    }
    
    var body: some View {
        
        switch self {
        case .new:
            return ToDoFormView(formVM: ToFormViewModel())
        case .update(let todo) :
            return ToDoFormView(formVM: ToFormViewModel(todo))
     
        }
    }
    
}
