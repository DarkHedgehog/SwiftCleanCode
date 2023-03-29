//
//  ProductDetailResult.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import Foundation

struct ProductDetailResult: Codable {
    let result: Int
    let errorMessage: String?
    let product: ProductDetail?
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case errorMessage = "error_message"
        case product = "product"
    }
}
