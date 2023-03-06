//
//  CatalogueListResult.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import Foundation

struct CatalogueListResult: Codable {
    let pageNumber: Int
    let products: [Product]
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products = "products"
    }
}
