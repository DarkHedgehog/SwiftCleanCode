//
//  Catalogue.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import Foundation
import Alamofire

class Catalogue: AbstractRequestFactory {
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

extension Catalogue: CatalogueRequestFactory {
    func list(
        pageNumber: Int,
        categoryId: Int,
        completionHandler: @escaping (Alamofire.AFDataResponse<[ProductShort]>) -> Void
    ) {
        let requestModel = CatalogueList(
            baseUrl: baseUrl,
            pageNumber: pageNumber,
            categoryId: categoryId
        )

        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func product(id: Int, completionHandler: @escaping (Alamofire.AFDataResponse<ProductDetailResult>) -> Void) {
        let requestModel = CatalogueProduct( baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Catalogue {
    struct CatalogueList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = NetworkConfig.productListPoint
        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }

    struct CatalogueProduct: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        let id: Int
        var parameters: Parameters? {
            return [
                "id_product": id
            ]
        }
    }
}
