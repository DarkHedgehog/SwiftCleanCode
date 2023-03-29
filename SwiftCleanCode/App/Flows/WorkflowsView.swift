//
//  MainView.swift
//  SwiftUILessons
//
//  Created by Aleksandr Derevenskih on 26.01.2023.
//

import SwiftUI

struct WorkflowsView: View {
    @Binding var userLoggedIn: User?

    var body: some View {
        TabView {
//            NewsFeed().tabItem {
//                Label("News", systemImage: "newspaper.fill")
//            }
            ProductsList(viewModel: ProductsViewModel())
            .tabItem {
                Label("Products", systemImage: "list.dash")
            }
            BasketList(viewModel: CartViewModel()).tabItem {
                Label("Basket", systemImage: "list.dash")
            }
            Settings(userLoggedIn: $userLoggedIn).tabItem {
                Label("Profile", systemImage: "gear")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            balance: 123.33,
            username: "Alex",
            password: "psdgdsag",
            email: "asas@sadasd.as",
            gender: "m",
            creditCard: "213523151235",
            bio: "2314523")
        WorkflowsView(userLoggedIn: .constant(user))
    }
}
