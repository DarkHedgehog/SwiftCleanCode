//
//  ProfileTests.swift
//  SwiftCleanCodeTests
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import XCTest
@testable import SwiftCleanCode

final class ProfileTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Profile tests")

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_registration() throws {
        // Given
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

    func test_profileEdit() throws {
        // Given
        let requestFactory = RequestFactory()
        let profile = requestFactory.makeProfileRequestFatory()

        // When
        profile.edit(
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
}
