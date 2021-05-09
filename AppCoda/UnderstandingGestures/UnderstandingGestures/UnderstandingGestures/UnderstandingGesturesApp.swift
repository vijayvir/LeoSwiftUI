//
//  UnderstandingGesturesApp.swift
//  UnderstandingGestures
//
//  Created by vijayvir on 09/05/2021.
//

import SwiftUI

@main
struct UnderstandingGesturesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RefactoringCodeUsingEnum()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
