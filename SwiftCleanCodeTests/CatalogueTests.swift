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
    }

    override func tearDownWithError() throws {
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
}
