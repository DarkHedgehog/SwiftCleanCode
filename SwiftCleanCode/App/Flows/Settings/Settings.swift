//
//  Settings.swift
//  SwiftUILessons
//
//  Created by Aleksandr Derevenskih on 27.01.2023.
//

import SwiftUI

struct Settings: View {
    @Binding var userLoggedIn: User?

    @State var isConfirmationLogout = false
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                if let profile = userLoggedIn {
                    ProfileView(profile: profile)
                }

                Button("Logout") {
                    isConfirmationLogout = true
                }
            }
        }.confirmationDialog("Logout", isPresented: $isConfirmationLogout) {
            Button("Logout") {
                userLoggedIn = nil
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            balance: 123.33,
            username: "Alex",
            password: "psdgdsag",
            email: "asas@sadasd.as",
            gender: "m",
            creditCard: "213523151235",
            bio: "2314523")
        Settings(userLoggedIn: .constant(user))
    }
}
