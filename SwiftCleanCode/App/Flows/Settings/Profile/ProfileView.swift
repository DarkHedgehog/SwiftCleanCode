//
//  ProfileView.swift
//  SwiftUILessons
//
//  Created by Aleksandr Derevenskih on 07.02.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                CircleImage(name: "DarkHedgehog", diameter: 150)
                    .modifier(BounceAnimation())
                VStack(alignment: .leading) {
                    Text(viewModel.profile?.username ?? "")
                    Text(viewModel.profile?.email ?? "")
                }
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))

            Text("Balance: \(viewModel.profile?.balance ?? 0)")
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
