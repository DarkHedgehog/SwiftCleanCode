//
//  ReviewListViewModel.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 27.03.2023.
//

import Foundation

class ReviewListViewModel: ObservableObject {
    @Published var productId: UUID
    @Published var reviews: [Review] = []

    public func fetch() {
        ApiDataService.shared.getReviewsForProduct(id: productId) { [weak self] result in
            self?.reviews = result ?? []
        }
    }

    init(productId: UUID, reviews: [Review]? = []) {
        self.productId = productId
        self.reviews = reviews ?? []
    }
}
