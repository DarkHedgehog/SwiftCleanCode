//
//  CartGetResult.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 30.03.2023.
//

import Foundation

struct CartGetResult: Codable {
    var result: Int
    var errorMessage: String?
    var userMessage: String?
    var cart: UserCart?

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case errorMessage = "error_message"
        case userMessage = "user_message"
        case cart = "data"
    }
}
