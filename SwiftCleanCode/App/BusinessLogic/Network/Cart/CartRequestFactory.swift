//
//  ReviewsRequestFactory.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 27.03.2023.
//

import Foundation
import Alamofire

protocol CartRequestFactory {
    func addProductToCart(
        userId: UUID,
        productId: UUID,
        completionHandler: @escaping (Alamofire.AFDataResponse<CartAddResult>) -> Void
    )

    func getCart(
        userId: UUID,
        completionHandler: @escaping (Alamofire.AFDataResponse<CartGetResult>) -> Void
    )

    func cartPayForAll(
        userId: UUID,
        sign: String,
        completionHandler: @escaping (Alamofire.AFDataResponse<CartGetResult>) -> Void
    )
}
