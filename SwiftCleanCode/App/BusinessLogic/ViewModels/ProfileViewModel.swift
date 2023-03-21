//
//  ProfileViewModel.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 20.03.2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: User?

    public func fetch() {
        profile = ApiDataService.shared.getProfile()
    }
}
