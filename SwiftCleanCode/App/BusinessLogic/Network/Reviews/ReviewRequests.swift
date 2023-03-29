//
//  ReviewRequests.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 27.03.2023.
//

import Foundation
import Alamofire

class ReviewRequests: AbstractRequestFactory {
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

extension ReviewRequests: ReviewsRequestFactory {
    func listForProduct(
        productId: UUID,
        completionHandler: @escaping (Alamofire.AFDataResponse<ReviewsListResult>) -> Void
    ) {
        let requestModel = ReviewsForProduct(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewRequests {
    struct ReviewsForProduct: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let productId: UUID
        let path = NetworkConfig.reviewsListPoint
        var parameters: Parameters? {
            return [
                "productId": productId
            ]
        }
    }
}
