//
//  NetworkConfig.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 16.03.2023.
//

import Foundation

final class NetworkConfig {
    static let baseUrl = URL(string: "http://192.168.1.106:8080/")!
    static let loginPoint = "login"
    static let registerPoint = "register"
}

final class OldNetworkConfig {
    static let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    static let loginPoint = "login.json"
    static let registerPoint = "registerUser.json"
}
