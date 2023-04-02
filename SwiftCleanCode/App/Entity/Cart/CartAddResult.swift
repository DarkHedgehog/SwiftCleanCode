//
//  ReviewResult.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 27.03.2023.
//

import Foundation

struct CartAddResult: Codable {
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
