//
//  ToDoError.swift
//  TODOAppSwift
//
//  Created by vijayvir on 30/04/2021.
//

import Foundation
import SwiftUI
enum ToDoError : Error , LocalizedError {
    case saveError
    case readError
    case decordingError
    case encordingError
    
    var errorDescription: String?{
        switch self {
  
        case .saveError:
            return NSLocalizedString("Could not save todo, Please reinstall the app", comment: "")
        case .readError:
            return NSLocalizedString("Could not save todo, Please reinstall the app", comment: "")
        case .decordingError:
            return NSLocalizedString("There was a pro😍blem in loading your Todos, please create a new Todo to start over", comment: "")
        case .encordingError:
            return NSLocalizedString("Could not save todo, Please reinstall the app", comment: "")
        }
    }
}


struct ErrorType : Identifiable  {
    var id = UUID()
    let error : ToDoError
    
}

























