//
//  Webview.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 05/05/2021.
//

import Foundation
import SwiftUI
import WebKit

struct Webview : UIViewRepresentable {
    
    typealias webviewType = WKWebView
    
    
    let urlString : String
    func makeUIView(context: Self.Context) -> webviewType {
        
        guard let url = URL(string: urlString) else {
            return WKWebView()
        }
        let wv = WKWebView()
        wv.load(URLRequest(url: url))
        return wv
    }

    /// Updates the state of the specified view with new information from
    /// SwiftUI.
    ///
    /// When the state of your app changes, SwiftUI updates the portions of your
    /// interface affected by those changes. SwiftUI calls this method for any
    /// changes affecting the corresponding UIKit view. Use this method to
    /// update the configuration of your view to match the new state information
    /// provided in the `context` parameter.
    ///
    /// - Parameters:
    ///   - uiView: Your custom view object.
    ///   - context: A context structure containing information about the current
    ///     state of the system.
    func updateUIView(_ uiView: webviewType, context: Self.Context){
        
    }
}
