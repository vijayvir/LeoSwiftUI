//
//  ToDo.swift
//  TODOAppSwift
//
//  Created by vijayvir on 29/04/2021.
//

import Foundation

struct ToDo : Identifiable , Codable{
    var id: String = UUID().uuidString
    var name : String
    var completed : Bool = false
    
    static var sampleData : [ToDo] {
        return [ ToDo(name: "Get Groceries"),
                 ToDo( name: "Make Dr.appointments", completed: true )
        ]
    }
    
}
