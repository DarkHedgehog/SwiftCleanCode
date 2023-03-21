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
    @State var isEditMode = false

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    if let profile = userLoggedIn {
                        ProfileView(viewModel: ProfileViewModel())

                        if let profile = Binding($userLoggedIn) {
                            NavigationLink {
                                ProfileEdit(profile: profile)
                            } label: {
                                Text("Edit")
                                    .frame(maxWidth: .infinity)
                            }.buttonStyle(.bordered)
                        }

                        Button {
                            isConfirmationLogout = true
                        } label: {
                            Text("Logout")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }.confirmationDialog("Logout", isPresented: $isConfirmationLogout) {
                Button("Logout") {
                    userLoggedIn = nil
                }.buttonStyle(.bordered)
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
