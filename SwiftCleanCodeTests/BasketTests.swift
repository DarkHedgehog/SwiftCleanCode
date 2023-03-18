//
//  BasketTests.swift
//  SwiftCleanCodeTests
//
//  Created by Aleksandr Derevenskih on 16.03.2023.
//

import XCTest
@testable import SwiftCleanCode

final class BasketTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Basket tests")

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testBasket() throws {
        let requestFactory = RequestFactory()
        let profile = requestFactory.makeProfileRequestFatory()

        // When
        profile.registration(
            userId: 123,
            userName: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language"
        ) { response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
