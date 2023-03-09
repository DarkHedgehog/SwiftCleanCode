//
//  Product.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import Foundation

struct ProductShort: Codable {
    let id: Int
    let name: String
    let price: Int
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}

struct ProductDetail: Codable {
    let id: Int
    let name: String
    let price: Int
    let description: String
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
