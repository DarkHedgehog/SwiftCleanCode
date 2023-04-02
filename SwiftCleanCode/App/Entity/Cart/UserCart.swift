//
//  UserCart.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 30.03.2023.
//

import Foundation

struct UserCart: Codable {
    let userId: UUID
    let products: [ProductShort]
    let totalCost: Double
    let balance: Double
}
