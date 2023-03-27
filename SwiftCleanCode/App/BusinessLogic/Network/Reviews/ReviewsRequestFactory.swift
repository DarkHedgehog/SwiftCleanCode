//
//  ReviewsRequestFactory.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 27.03.2023.
//

import Foundation
import Alamofire

protocol ReviewsRequestFactory {
    func listForProduct(
        productId: UUID,
        completionHandler: @escaping (Alamofire.AFDataResponse<ReviewsListResult>) -> Void
    )
}
