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
}
