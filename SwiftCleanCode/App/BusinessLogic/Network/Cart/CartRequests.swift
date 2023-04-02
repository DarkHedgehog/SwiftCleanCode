//
//  CartRequests.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 30.03.2023.
//

import Foundation
import Alamofire

class CartRequests: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = NetworkConfig.baseUrl

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension CartRequests: CartRequestFactory {
    func addProductToCart(
        userId: UUID,
        productId: UUID,
        completionHandler: @escaping (Alamofire.AFDataResponse<CartChangesResult>) -> Void
    ) {
        let requestModel = ProductAddToCart( baseUrl: baseUrl, userId: userId, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func removeProductFromCart(
        userId: UUID,
        productId: UUID,
        completionHandler: @escaping (Alamofire.AFDataResponse<CartChangesResult>) -> Void
    ) {
        let requestModel = ProductRemoveFromCart( baseUrl: baseUrl, userId: userId, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func getCart(userId: UUID, completionHandler: @escaping (Alamofire.AFDataResponse<CartGetResult>) -> Void) {
        let requestModel = CartGet( baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func cartPayForAll(
        userId: UUID,
        sign: String,
        completionHandler: @escaping (Alamofire.AFDataResponse<CartGetResult>) -> Void
    ) {
        let requestModel = CartPayForAll( baseUrl: baseUrl, userId: userId, sign: sign)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension CartRequests {

    struct ProductRemoveFromCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .delete
        let path: String
        let userId: UUID
        let productId: UUID
        var parameters: Parameters? {
            return [
                "productId": productId
            ]
        }

        init(baseUrl: URL, userId: UUID, productId: UUID) {
            self.baseUrl = baseUrl
            self.userId = userId
            self.productId = productId
            self.path = NetworkConfig.cartChangeProductPoint + "/" + userId.uuidString
        }
    }

    struct ProductAddToCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String
        let userId: UUID
        let productId: UUID
        var parameters: Parameters? {
            return [
                "productId": productId
            ]
        }

        init(baseUrl: URL, userId: UUID, productId: UUID) {
            self.baseUrl = baseUrl
            self.userId = userId
            self.productId = productId
            self.path = NetworkConfig.cartChangeProductPoint + "/" + userId.uuidString
        }
    }

    struct CartGet: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String
        let userId: UUID
        var parameters: Parameters? {
            return [:]
        }

        init(baseUrl: URL, userId: UUID) {
            self.baseUrl = baseUrl
            self.userId = userId
            self.path = NetworkConfig.cartGetPoint + "/" + userId.uuidString
        }
    }

    struct CartPayForAll: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String
        let userId: UUID
        let sign: String
        var parameters: Parameters? {
            return [
                "sign": sign
            ]
        }

        init(baseUrl: URL, userId: UUID, sign: String) {
            self.baseUrl = baseUrl
            self.userId = userId
            self.sign = sign
            self.path = NetworkConfig.cartpayForAll + "/" + userId.uuidString
        }
    }
}
