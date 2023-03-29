//
//  ReviewResult.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 27.03.2023.
//

import Foundation

struct ReviewsListResult: Codable {
    let result: Int
    let reviews: [Review]?
    var errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case errorMessage = "error_message"
        case reviews = "reviews"
    }
}
