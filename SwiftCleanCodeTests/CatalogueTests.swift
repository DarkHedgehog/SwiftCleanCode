//
//  CatalogueTests.swift
//  SwiftCleanCodeTests
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import XCTest
@testable import SwiftCleanCode

final class CatalogueTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Catalogue tests")

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_catalogueList() throws {
        let requestFactory = RequestFactory()
        let catalogue = requestFactory.makeCatalogueRequestFatory()

        catalogue.list(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.count, 2)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func test_catalogueProduct() throws {
        let requestFactory = RequestFactory()
        let catalogue = requestFactory.makeCatalogueRequestFatory()
        let productId = 1

        catalogue.product(id: productId) { response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
                let product = ProductListDetailView(
                    id: productId,
                    name: result.productName,
                    price: result.productPrice,
                    description: result.productDescription)
                XCTAssertEqual(product.name, "Ноутбук")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
