//
//  ContentView.swift
//  AsyncImageLoad
//
//  Created by Dan Mori on 10/07/22.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 120)
                .foregroundColor(.purple)
                .opacity(0.5)
        }
        padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
