//
//  CatalogueRequestFactory.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import Foundation
import Alamofire

protocol CatalogueRequestFactory {
    func list(
        pageNumber: Int,
        categoryId: Int,
        completionHandler: @escaping (Alamofire.AFDataResponse<[ProductShort]>) -> Void
    )
    func product(
        id: Int,
        completionHandler: @escaping (Alamofire.AFDataResponse<ProductDetailResult>) -> Void
    )
}
