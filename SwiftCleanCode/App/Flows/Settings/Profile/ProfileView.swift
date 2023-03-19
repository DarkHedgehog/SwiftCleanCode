//
//  ProfileView.swift
//  SwiftUILessons
//
//  Created by Aleksandr Derevenskih on 07.02.2023.
//

import SwiftUI

struct ProfileView: View {
    @State var profile: User

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                CircleImage(name: "DarkHedgehog", diameter: 150)
                    .modifier(BounceAnimation())
                VStack(alignment: .leading) {
                    Text(profile.username)
                    Text(profile.email)
                }
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))

            Text("Balance: \(profile.balance)")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            balance: 123.33,
            username: "Alex",
            password: "psdgdsag",
            email: "asas@sadasd.as",
            gender: "m",
            creditCard: "213523151235",
            bio: "2314523")

        ProfileView(profile: user)
    }
}
