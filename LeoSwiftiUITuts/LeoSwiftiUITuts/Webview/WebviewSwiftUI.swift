//
//  WebviewSwiftUI.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI

struct WebviewSwiftUI: View {
    var body: some View {
        Webview(urlString: "https://google.com")
    }
}

struct WebviewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        WebviewSwiftUI()
    }
}
