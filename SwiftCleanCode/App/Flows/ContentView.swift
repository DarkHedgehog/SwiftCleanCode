//
//  ContentView.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 09.02.2023.
//

import SwiftUI

struct ContentView: View {
    let requestFactory = RequestFactory()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }

    init() {
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
