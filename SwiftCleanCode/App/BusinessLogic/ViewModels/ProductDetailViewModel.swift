//
//  ProductDetailViewModel.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 27.03.2023.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var productId: UUID
    @Published var product: ProductDetail?
    @Published var reviews: [Review] = []

    public func fetch() {
        ApiDataService.shared.getProductDetail(id: productId) { [weak self] result in
            self?.product = result
        }
        ApiDataService.shared.getReviewsForProduct(id: productId) { [weak self] result in
            self?.reviews = result ?? []
        }
    }

    init(productId: UUID, product: ProductDetail? = nil) {
        self.productId = productId
        self.product = product
    }
}
