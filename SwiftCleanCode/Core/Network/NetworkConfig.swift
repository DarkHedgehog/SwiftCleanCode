//
//  NetworkConfig.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 16.03.2023.
//

import Foundation

final class NetworkConfig {
    static let baseUrl = URL(string: "http://192.168.1.118:8080/")!
//    static let baseUrl = URL(string: "https://swiftcleancodemock.onrender.com/")!
    static let loginPoint = "login"
    static let registerPoint = "register"
    static let editProfilePoint = "updateProfile"
    static let readProfilePoint = "getProfile"
    static let productListPoint = "products"
    static let productGetPoint = "products"
    static let reviewsListPoint = "reviews"
    static let cartChangeProductPoint = "basket"
    static let cartGetPoint = "basket"
    static let cartpayForAll = "payBasket"
}

final class OldNetworkConfig {
    static let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    static let loginPoint = "login.json"
    static let registerPoint = "registerUser.json"
    static let editProfilePoint = "changeUserData.json"
    static let productListPoint = "catalogData.json"
    static let productGetPoint = "getGoodById.json"
}
