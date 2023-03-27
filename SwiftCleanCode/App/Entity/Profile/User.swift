//
//  User.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 02.03.2023.
//

import Foundation

struct User: Codable {
    var id: UUID?
    var username: String
    var password: String
    var email: String
    var gender: String
    var creditCard: String
    var bio: String
    var balance: Double
    
    init(
        id: UUID? = nil,
        balance: Double,
        username: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String
    ) {
        self.id = id
        self.balance = balance
        self.username = username
        self.password = password
        self.email = email
        self.gender = gender
        self.creditCard = creditCard
        self.bio = bio
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case password = "password"
        case email = "email"
        case gender = "gender"
        case creditCard = "credit_card"
        case bio = "bio"
        case balance = "balance"
    }
    
}
