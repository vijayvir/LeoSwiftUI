//
//  ContentView.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 29/04/2021.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var body: some View {
        HStack {
            ForEach(1..<6) { index in
                Button(action: { rating = index }) {
                    Image(systemName: index <= rating ? "star.fill" : "star")
                }
            }
        }
        .accessibilityElement()
        .accessibilityLabel(Text("rating"))
        .accessibilityValue(Text(String(rating)))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                guard rating < 5 else { break }
                rating += 1
            case .decrement:
                guard rating > 1 else { break }
                rating -= 1
            @unknown default:
                break
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
