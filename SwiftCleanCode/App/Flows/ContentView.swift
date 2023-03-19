//
//  ContentView.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 09.02.2023.
//

import SwiftUI

struct ContentView: View {
    let requestFactory = RequestFactory()
    @State private var userLoggedIn: User?

    var body: some View {
        if userLoggedIn != nil {
            WorkflowsView(userLoggedIn: $userLoggedIn)
        } else {
             LoginView(userLoggedIn: $userLoggedIn)
        }
    }
    init() {
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
