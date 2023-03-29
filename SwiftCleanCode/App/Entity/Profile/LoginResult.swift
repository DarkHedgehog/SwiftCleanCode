//
//  LoginResult.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 02.03.2023.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User?
    let userMessage: String?
    var errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case user = "user"
        case userMessage = "user_message"
        case errorMessage = "error_message"
    }
}
