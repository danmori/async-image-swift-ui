//
//  ContentView.swift
//  AsyncImageLoad
//
//  Created by Dan Mori on 10/07/22.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(minWidth: 120)
            .foregroundColor(.teal)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://developer.apple.com/assets/elements/icons/swiftui/swiftui-96x96_2x.png"
    
    var body: some View {
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
