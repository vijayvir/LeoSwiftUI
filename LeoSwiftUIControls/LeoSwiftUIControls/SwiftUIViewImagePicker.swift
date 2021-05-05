//
//  SwiftUIViewImagePicker.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI

struct SwiftUIViewImagePicker: View {

    @State var showImagePicker: Bool = false
    @State var image: Image? = nil

    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    self.showImagePicker.toggle()
                }) {
                    Text("Show image picker")
                }
                image?.resizable().frame(width: 100, height: 100)
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    self.image = Image(uiImage: image)
                }
            }
        }
    }
}
struct SwiftUIViewImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewImagePicker()
    }
}
