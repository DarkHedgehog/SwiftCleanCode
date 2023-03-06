//
//  ProductDetailResult.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import Foundation

struct ProductDetailResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
