//
//  AuthTest.swift
//  SwiftCleanCodeTests
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import XCTest

@testable import SwiftCleanCode

final class AuthTest: XCTestCase {
    let expectation = XCTestExpectation(description: "Auth tests")

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_login() throws {
        // Given
        let requestFactory = RequestFactory()
        let auth = requestFactory.makeAuthRequestFatory()

        // When
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success:
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func test_logout() throws {
        // Given
        let requestFactory = RequestFactory()
        let auth = requestFactory.makeAuthRequestFatory()

        // When
        auth.logout(userId: 123) { response in
            switch response.result {
            case .success:
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
