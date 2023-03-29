//
//  Product.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import Foundation

struct ProductShort: Codable, Identifiable {
    let id: UUID
    let name: String
    let price: Double
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "cost"
    }
}

struct ProductDetail: Codable {
    let id: UUID
    let name: String
    let price: Double
//    let description: String
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "cost"
//        case description = "product_description"
    }
}
