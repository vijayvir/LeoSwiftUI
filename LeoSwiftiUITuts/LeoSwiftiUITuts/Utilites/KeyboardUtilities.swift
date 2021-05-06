//
//  KeyboardUtilities.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 06/05/2021.
//

import Foundation
import UIKit
import SwiftUI
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
