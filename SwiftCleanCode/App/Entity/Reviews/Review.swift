//
//  Review.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 27.03.2023.
//

import Foundation

struct Review: Codable, Identifiable {
    let id: UUID
    let product: ProductDetail
    let user: User
    let stars: Int
    let text: String
}
