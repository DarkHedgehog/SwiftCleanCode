//
//  ProfileEdit.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 20.03.2023.
//

import SwiftUI

struct ProfileEdit: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var profile: User
    @State private var showUpdateErrorWarning = false

    let profileReq = RequestFactory().makeProfileRequestFatory()

    var body: some View {
        ScrollView(.vertical) {
            TextField("Name", text: $profile.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disabled(true)
            TextField("Email", text: $profile.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("bio", text: $profile.bio)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("credit Card", text: $profile.creditCard)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button {
                saveProfile {
                    DispatchQueue.main.async {
                        self.mode.wrappedValue.dismiss()
                    }
                }
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
        .alert(isPresented: $showUpdateErrorWarning) {
            Alert(
                title: Text("Error"),
                message: Text("Update profile failed"))
        }
    }

    private func saveProfile(_ completion: @escaping () -> Void) {
        guard let userId = profile.id else {
            showUpdateErrorWarning = true
            return
        }

        profileReq.edit(
            userId: userId,
            userName: profile.username,
            password: profile.password,
            email: profile.email,
            gender: profile.gender,
            creditCard: profile.creditCard,
            bio: profile.bio
        ) { response in
            switch response.result {
            case .success(let result):
                completion()

            case .failure(let error):
                showUpdateErrorWarning = true
            }
        }
    }
}

struct ProfileEdit_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            balance: 123.33,
            username: "Alex",
            password: "psdgdsag",
            email: "asas@sadasd.as",
            gender: "m",
            creditCard: "213523151235",
            bio: "2314523")

        ProfileEdit(profile: .constant(user))
    }
}
