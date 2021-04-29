//
//  ToFormViewModel.swift
//  TODOAppSwift
//
//  Created by vijayvir on 29/04/2021.
//

import Foundation

class ToFormViewModel : ObservableObject {
    @Published var name = ""
    @Published var completed = false
    var id : String?
    
    var updating : Bool {
        id != nil
    }
    var isDisable : Bool {
        if name.isEmpty {
            return true
        }
        return false
        
    }
    
    init(_ currentToDo : ToDo) {
        self.name = currentToDo.name
        self.completed = currentToDo.completed
        self.id = currentToDo.id
    }
    
    init() {
        
    }
    
    
}
